package ru.pkozlov.hellogitactions.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String greeting(@RequestParam(required = false) String name) {
        if (name != null) {
            return "Hello, " + name + "!!";
        }
        return "Hello, gitActions!";
    }
}
