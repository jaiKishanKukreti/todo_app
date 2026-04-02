package com.todo.repository;

import com.todo.model.Todo;
import org.springframework.data.jpa.repository.JpaRepository;

@org.springframework.stereotype.Repository
public interface Repository extends JpaRepository<Todo,Long> {
}
