package com.todo.service;

import com.todo.model.Todo;

public interface Service {
    Todo createTodo(Todo todo);
    Todo getTodo(Long id);
}
