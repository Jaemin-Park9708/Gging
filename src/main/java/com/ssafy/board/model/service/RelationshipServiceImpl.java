package com.ssafy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.board.model.dao.RelationshipDao;
import com.ssafy.board.model.dto.Relationship;

@Service
public class RelationshipServiceImpl implements RelationshipService {
	
	private RelationshipDao relationshipDao;

	@Autowired
	public void setRelationshipDao(RelationshipDao relationshipDao) {
		this.relationshipDao = relationshipDao;
	}

	public RelationshipDao getRelationshipDao() {
		return this.relationshipDao;
	}
	
	@Override
	public List<Relationship> findFriends(String id) {
		return relationshipDao.findFriends(id);
	}

	@Override
	@Transactional
	public int deleteRelationship(Relationship relationship) {
		return relationshipDao.deleteRelationship(relationship);
	}

	@Override
	@Transactional
	public int insertRelationship(Relationship relationship) {
		return relationshipDao.insertRelationship(relationship);
	}
}
