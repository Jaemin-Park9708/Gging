package com.ssafy.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ssafy.board.model.dto.Board;
import com.ssafy.board.model.dto.BoardAndComments;
import com.ssafy.board.model.dto.Comment;
import com.ssafy.board.model.dto.Email;
import com.ssafy.board.model.dto.EmailAndMsg;
import com.ssafy.board.model.dto.Relationship;
import com.ssafy.board.model.dto.SearchCondition;
import com.ssafy.board.model.dto.User;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.board.model.service.CommentService;
import com.ssafy.board.model.service.EmailService;
import com.ssafy.board.model.service.RelationshipService;
import com.ssafy.board.model.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	ResourceLoader resLoader;

	@Autowired
	UserService uService;

	@Autowired
	BoardService bService;

	@Autowired
	CommentService cService;

	@Autowired
	RelationshipService rService;

	@Autowired
	private EmailService mailService;

	@GetMapping({ "/", "/index" })
	public String showIndex() {
		return "index";
	}

	private String secreteCode;

	@GetMapping("/goHome")
	public String goHome(HttpSession session) {
		session.removeAttribute("msg");
		return "index";
	}

	@GetMapping("/inappropriateAccess")
	public String goBack() {
		return "error/inappropriateAccess";
	}

	@GetMapping("/regist")
	public String showRegistForm(@ModelAttribute("from") String from, Model model, HttpSession session,
			HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		System.out.println(flashMap);
		if (flashMap != null) {
			if (flashMap.get("eam") != null) {
				EmailAndMsg eam = (EmailAndMsg) flashMap.get("eam");
				System.out.println(eam);
				model.addAttribute("email", eam.getEmail());
				model.addAttribute("msg", eam.getMsg());
				return "user/regist";
			} else {
				model.addAttribute("msg", flashMap.get("msg"));
			}
		}
		model.addAttribute("from", from);
		return "user/regist";
	}

	@PostMapping("/regist")
	public String doRegist(@ModelAttribute User user, @ModelAttribute("from") String from,
			@RequestPart(required = false) MultipartFile file, HttpServletRequest request, Model model,
			RedirectAttributes ra, HttpSession session) throws IllegalStateException, IOException {
		session.removeAttribute("email");
		if (uService.selectUserByID(user.getId()) != null) {
			ra.addFlashAttribute("msg", "아이디 중복");
			return "redirect:/index";
		}
		if (uService.selectUserByEmail(user.getEmail()) != null) {
			ra.addFlashAttribute("msg", "이메일 중복");
			return "redirect:/index";
		}
		if (file != null && file.getSize() > 0) {
			Resource res = resLoader.getResource("resources/upload");
			user.setImg(System.currentTimeMillis() + "_" + file.getOriginalFilename());
			user.setOrgImg(file.getOriginalFilename());
			file.transferTo(new File(res.getFile().getCanonicalPath() + "/" + user.getImg()));
		}
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		user.setRegistDate(nowFormat.format(now));
		uService.insert(user);
//		model.addAttribute("msg", "회원가입 완료");
		if (from.equals("userList")) {
			ra.addFlashAttribute("msg", "회원등록 완료");
			return "redirect:/userList";
		}
		ra.addFlashAttribute("msg", "회원가입 완료");
		return "redirect:/index";
	}

	@GetMapping("/userList")
	public String showList(Model model) {
		model.addAttribute("users", uService.selectAll());
		return "user/userList";
	}

	@GetMapping("/login")
	public String showLoginForm() {
		return "user/login";
	}

	@PostMapping("/login")
	public String doLogin(@ModelAttribute User user, HttpSession session, Model model, RedirectAttributes ra) {
		String view = "redirect:/";
		System.out.println("user: " + user);
		User loginUser = uService.selectUserByID(user.getId());
		if (loginUser != null && user.getPassword().equals(loginUser.getPassword())) {
			session.setAttribute("loginUser", loginUser);
			session.removeAttribute("msg");
			view = "redirect:/index";
		} else {
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
		}
		return view;
	}

	@GetMapping("/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/mainBoard")
	public String showBoard(HttpSession session, Model model) {
		session.removeAttribute("msg");
		model.addAttribute("notice", bService.selectByUserId("administrator"));
		model.addAttribute("board", bService.selectExceptNotice());
		return "board/mainBoard";
	}

	@GetMapping("/boardDetail")
	public String showBoardDetail(@ModelAttribute Board board, HttpServletRequest request, HttpSession session,
			Model model) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		System.out.println(flashMap);
		if (flashMap != null) {
			BoardAndComments bac = (BoardAndComments) flashMap.get("bac");
			System.out.println(bac);
			Board b = bac.getBoard();
			List<Comment> comments = bac.getComments();
			model.addAttribute("board", b);
			if (comments != null)
				model.addAttribute("comments", comments);
			return "board/boardDetail";
		}
		int no = board.getNo();
		System.out.println("boardNo: " + no);
		Board b = bService.selectByNo(no);
		model.addAttribute("board", b);
		model.addAttribute("comments", cService.selectByBoardNo(no));
		return "board/boardDetail";
	}

	@PostMapping("/writeComment")
	public String doWriteComment(@ModelAttribute Comment comment, RedirectAttributes rta)
			throws ServletException, IOException {
		System.out.println("asdfasdfasfsda: " + comment);
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		Comment c = new Comment();
		c.setBoardNo(comment.getBoardNo());
		c.setId(comment.getId());
		c.setContent(comment.getContent());
		c.setGeneratedDate(nowFormat.format(now));
		c.setModifiedDate(nowFormat.format(now));
		System.out.println(comment);
		System.out.println("comment:" + c);
		cService.insert(c);
		BoardAndComments bac = new BoardAndComments(bService.selectByNo(c.getBoardNo()),
				cService.selectByBoardNo(c.getBoardNo()));
		rta.addFlashAttribute("bac", bac);
		return "redirect:/boardDetail?no=" + c.getBoardNo();
	}

//	@GetMapping("/afterWriteComment")
//	public String afterWriteComment(HttpServletRequest request, Model model) {
//		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
//		if (flashMap != null) {
//			BoardAndComments bac = (BoardAndComments)flashMap.get("bac");
//			Board board = bac.getBoard();
//			List<Comment> comments = bac.getComments();
//			model.addAttribute("board", board);
//			model.addAttribute("comments", comments);
//		}
//		return "board/boardDetail";
//	}

	@GetMapping("/write")
	public String showWriteForm() {
		return "board/write";
	}

	@PostMapping("/write")
	public String doWrite(@ModelAttribute Board board, HttpSession session, RedirectAttributes ra) {
		User writer = (User) session.getAttribute("loginUser");
		System.out.println(writer);
		System.out.println(board);
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		Board b = new Board(0, board.getTitle(), writer.getId(), board.getContent(), nowFormat.format(now),
				nowFormat.format(now));
		bService.insert(b);
		BoardAndComments bac = new BoardAndComments();
		bac.setBoard(b);
		ra.addFlashAttribute("bac", bac);
		SearchCondition con = new SearchCondition("id", writer.getId(), "no", "desc");
		int boardNo = bService.searchByCondition(con).get(0).getNo();
//		return "redirect:/boardDetail?no=" + boardNo;
		return "redirect:/mainBoard";
	}

	@GetMapping("/deleteBoard")
	public String doDeleteBoard(@ModelAttribute Board board, HttpServletRequest request, Model model) {
		bService.delete(board.getNo());
		List<Comment> comments = cService.selectByBoardNo(board.getNo());
		for (Comment c : comments) {
			cService.delete(c.getCommentNo());
		}
		try {
			if (request.getParameter("from").equals("myPage"))
				return "redirect:/myPage";
		} catch (Exception e) {
			model.addAttribute("notice", bService.selectByUserId("administrator"));
			model.addAttribute("board", bService.selectExceptNotice());
		}
		return "board/mainBoard";
	}

	@GetMapping("/modifyBoard")
	public String showModifyForm(@ModelAttribute Board board, HttpServletRequest request, Model model) {
		model.addAttribute("board", bService.selectByNo(board.getNo()));
		model.addAttribute("from", request.getParameter("from"));
		System.out.println(model);
		System.out.println("좀!!!!: " + model.getAttribute("from"));
		System.out.println("출처: " + request.getParameter("from"));
		return "board/modifyContent";
	}

	@PostMapping("/modifyBoard")
	public String doModifyBoard(@ModelAttribute("board") Board board, @ModelAttribute("from") String from,
			Model model) {
		Board b = bService.selectByNo(board.getNo());
		System.out.println("바꿀 보드: " + b);
		b.setTitle(board.getTitle());
		b.setContent(board.getContent());
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		b.setModifiedDate(nowFormat.format(now));
		System.out.println("바뀐 보드: " + b);
		bService.update(b);
		System.out.println(from);
		if (from.equals("myPage"))
			return "redirect:/myPage";
		model.addAttribute("board", b);
		return "redirect:/boardDetail?no=" + b.getNo();
	}

	@GetMapping("/deleteUser")
	public String doDeleteUser(@ModelAttribute User user, HttpServletRequest request, Model model) {
		try {
			if (request.getParameter("from").equals("myPage"))
				return "user/withdraw";
		} catch (Exception e) {
			uService.delete(user.getId());
			model.addAttribute("users", uService.selectAll());
		}
		return "user/userList";
	}

	@PostMapping("/deleteUser")
	public String doWithdraw(@ModelAttribute("password") String password, HttpSession session, RedirectAttributes ra)
			throws ParseException {
		User user = (User) session.getAttribute("loginUser");
		User u = uService.selectUserByID(user.getId());
		String registDate = u.getRegistDate();
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		Date a = nowFormat.parse(registDate);
		long diffSec = (now.getTime() - a.getTime()) / 1000;
		long diffDays = diffSec / (24 * 60 * 60);
		if (u.getPassword().equals(password)) {
			uService.delete(u.getId());
			ra.addFlashAttribute("msg", u.getName() + " 님과 함께한 " + diffDays + "일동안 감사했습니다.");
			session.invalidate();
			return "redirect:/index";
		} else {
			if (!u.getId().equals("administrator")) {
				ra.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
				return "redirect:/myPage";
			}
			ra.addFlashAttribute("from", "myPage");
			return "redirect:/deleteUser";
		}
	}

	@GetMapping("/modifyUser")
	public String showModifyUserForm(@ModelAttribute User user, Model model) {
		model.addAttribute("user", uService.selectUserByID(user.getId()));
		return "user/modifyUser";
	}

	@PostMapping("/modifyUser")
	public String doModifyUser(@ModelAttribute User user, @RequestPart(required = false) MultipartFile file,
			HttpSession session, Model model, RedirectAttributes ra) throws IllegalStateException, IOException {
		User u = uService.selectUserByID(user.getId());
		u.setPassword(user.getPassword());
		u.setAge(user.getAge());
		if (file != null && file.getSize() > 0) {
			Resource res = resLoader.getResource("resources/upload");
			u.setImg(System.currentTimeMillis() + "_" + file.getOriginalFilename());
			u.setOrgImg(file.getOriginalFilename());
			file.transferTo(new File(res.getFile().getCanonicalPath() + "/" + u.getImg()));
		}
		uService.modifyUser(u);
		model.addAttribute("msg", "회원 정보 수정완료");
		User lu = (User) session.getAttribute("loginUser");
		User loginUser = uService.selectUserByID(lu.getId());
		if (loginUser.getId().equals("administrator")) {
			model.addAttribute("users", uService.selectAll());
			return "user/userList";
		} else {
			ra.addFlashAttribute("msg", "회원 정보 수정완료");
			return "redirect:/myPage";
		}
	}

	@GetMapping("/searchUser")
	public String doSearchUser(SearchCondition con, Model model) {
		model.addAttribute("con", con);
		List<User> list = uService.searchByCondition(con);
		model.addAttribute("users", list);
		return "user/userList";
	}

	@GetMapping("/searchBoard")
	public String doSearchBoard(SearchCondition con, Model model) {
		model.addAttribute("con", con);
		System.out.println(con);
		if (con.getKey().equals("none") && con.getOrderBy().equals("none")) {
			model.addAttribute("notice", bService.selectByUserId("administrator"));
			model.addAttribute("board", bService.selectExceptNotice());
		} else {
			model.addAttribute("board", bService.searchByCondition(con));
		}
		return "board/mainBoard";
	}

	@GetMapping("/deleteComment")
	public String doDeleteComment(@ModelAttribute Comment comment, HttpServletRequest request, Model model) {
		cService.delete(comment.getCommentNo());
		try {
			if (request.getParameter("from").equals("myPage")) {
				return "redirect:/myPage";
			}
		} catch (Exception e) {
			int no = comment.getBoardNo();
			model.addAttribute("board", bService.selectByNo(no));
			model.addAttribute("comments", cService.selectByBoardNo(no));
		}
		return "board/boardDetail";
	}

	@GetMapping("/modifyComment")
	public String showCommentModifyForm(@ModelAttribute Comment comment, Model model) {
		Comment c = cService.selectByCommentNo(comment.getCommentNo());
		model.addAttribute("comment", c);
		return "board/modifyComment";
	}

	@PostMapping("/modifyComment")
	public String doModifyComment(@ModelAttribute Comment comment, RedirectAttributes ra) {
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		Comment c = cService.selectByCommentNo(comment.getCommentNo());
		System.out.println(comment);
		System.out.println(c);
		c.setContent(comment.getContent());
		c.setModifiedDate(nowFormat.format(now));
		cService.update(c);
		BoardAndComments bac = new BoardAndComments(bService.selectByNo(c.getBoardNo()),
				cService.selectByBoardNo(c.getBoardNo()));
		ra.addFlashAttribute("bac", bac);
		return "redirect:/boardDetail?no=" + c.getBoardNo();
	}

	@GetMapping("/myPage")
	public String showMyPage(@ModelAttribute User u, HttpSession session, Model model, RedirectAttributes ra) {
		User user = (User) session.getAttribute("loginUser");
		User otherUser = uService.selectUserByID(u.getId());
		if (user == null) {
			ra.addFlashAttribute("msg", "로그인을 해주세요");
			return "redirect:/index";
		}
		if (otherUser == null || otherUser.getId().equals(user.getId())) {
			model.addAttribute("comments", cService.selectByUserId(user.getId()));
			model.addAttribute("boards", bService.selectByUserId(user.getId()));
			System.out.println(user.getId());
			System.out.println(rService.findFriends(user.getId()));
			List<Relationship> relationships = new ArrayList<>(rService.findFriends(user.getId()));
			System.out.println("relationships: " + relationships);
			List<User> friends = new ArrayList<>();
			if (!relationships.isEmpty()) {
				for (Relationship relationship : relationships) {
					friends.add(uService.selectUserByID(relationship.getIdB()));
				}
				model.addAttribute("friends", friends);
			}
		} else {
			model.addAttribute("comments", cService.selectByUserId(otherUser.getId()));
			model.addAttribute("boards", bService.selectByUserId(otherUser.getId()));
			model.addAttribute("otherUser", otherUser);
			List<Relationship> relationships = new ArrayList<>(rService.findFriends(user.getId()));
			List<User> friends = new ArrayList<>();
			if (!relationships.isEmpty()) {
				for (Relationship relationship : relationships) {
					friends.add(uService.selectUserByID(relationship.getIdB()));
				}
				for (User friend : friends) {
					if (friend.getId().equals(otherUser.getId())) {
						model.addAttribute("friendOrNot", "yes");
					}
					break;
				}
			}
		}
		model.addAttribute("user", user);
		return "user/myPage";
	}

	@GetMapping("/deleteFriend")
	public String deleteFriend(@ModelAttribute Relationship relationship, HttpSession session, Model model,
			RedirectAttributes ra) {
		System.out.println("관계: " + relationship);
		rService.deleteRelationship(relationship);
		ra.addFlashAttribute("user", (User) session.getAttribute("loginUser"));
		return "redirect:/myPage";
	}

	@GetMapping("/addFriend")
	public String addFriend(@ModelAttribute Relationship relationship, RedirectAttributes ra) {
		rService.insertRelationship(relationship);
		ra.addFlashAttribute("user", uService.selectUserByID(relationship.getIdA()));
		return "redirect:/myPage";
	}

	@GetMapping("/sendMail")
	public String sendEmail(@ModelAttribute("email") String email, Model model, RedirectAttributes ra)
			throws Exception {
		Random rand = new Random();
		secreteCode = "";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			secreteCode += ran;
		}
		Email mail = new Email("Gging", "gging0428@gmail.com", email, "Gging 인증번호 입니다.",
				"Gging 인증번호 입니다. ( " + secreteCode + " )\n환영합니다.");
		System.out.println(mail);
		mailService.sendMail(mail);
		EmailAndMsg eam = new EmailAndMsg(email, "인증번호가 전송되었습니다.");
		ra.addFlashAttribute("eam", eam);
		return "redirect:/regist";
	}

	@PostMapping("/verify")
	public String doVerify(@ModelAttribute("email") String email, @ModelAttribute("code") String code, Model model,
			RedirectAttributes ra) {
		System.out.println(secreteCode);
		System.out.println("code: " + code);
		if (secreteCode.equals(code)) {
			model.addAttribute("email", email);
			model.addAttribute("verification", "verified");
			return "user/regist";
		} else {
			ra.addFlashAttribute("msg", "인증번호가 틀렸습니다.");
			return "redirect:/regist";
		}
	}

	@GetMapping("error/404")
	private String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error/errorPage";
	}
}
