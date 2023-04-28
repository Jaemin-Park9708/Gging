package com.ssafy.board.model.dao;

import java.util.List;

import com.ssafy.board.model.dto.Relationship;

public interface RelationshipDao {
	
	int insertRelationship(Relationship relationship);

	int deleteRelationship(Relationship relationship);

	List<Relationship> findFriends(String id);
	
}
