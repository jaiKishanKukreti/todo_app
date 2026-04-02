package com.todo.controller;


import com.todo.model.Todo;
import com.todo.service.Service;
import lombok.RequiredArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RequiredArgsConstructor
@RestController
@RequestMapping("/api/public")
public class TodoController {

    final private Service service;

    @PostMapping("/todo")
    public ResponseEntity<Todo> createTodo(@RequestBody Todo todo){
        return ResponseEntity.ok(service.createTodo(todo));
    }

    @GetMapping("/todo/{id}")
    public ResponseEntity<Todo> getTodo(@PathVariable("id") Long id){
       return ResponseEntity.ok(service.getTodo(id));

    }

}
