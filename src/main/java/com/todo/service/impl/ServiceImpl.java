package com.todo.service.impl;

import com.todo.model.Todo;
import com.todo.repository.Repository;
import com.todo.service.Service;
import lombok.RequiredArgsConstructor;

@org.springframework.stereotype.Service
@RequiredArgsConstructor
public class ServiceImpl implements Service {

    final private Repository repository;

    @Override
    public Todo createTodo(Todo todo) {
        return repository.save(todo);
    }

    @Override
    public Todo getTodo(Long id) {
        Todo todo= repository.findById(id)
                .orElseThrow(()-> new RuntimeException("Usernot found"));
        return todo;
    }
}
