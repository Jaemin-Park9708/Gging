package com.ssafy.board.model.service;

import java.util.List;

import com.ssafy.board.model.dto.Relationship;

public interface RelationshipService {

	int insertRelationship(Relationship relationship);

	int deleteRelationship(Relationship relationship);

	List<Relationship> findFriends(String id);

}
