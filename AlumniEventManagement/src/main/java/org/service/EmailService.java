/*
 * package org.service;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.mail.SimpleMailMessage; import
 * org.springframework.mail.javamail.JavaMailSender; import
 * org.springframework.stereotype.Service;
 * 
 * @Service public class EmailService {
 * 
 * @Autowired private JavaMailSender mailSender;
 * 
 * public void sendFeedbackNotification(String adminEmail, String studentName) {
 * SimpleMailMessage message = new SimpleMailMessage();
 * message.setTo(adminEmail); message.setSubject("New Feedback Submitted");
 * message.setText("A student named " + studentName +
 * " has submitted feedback."); mailSender.send(message); } }
 */