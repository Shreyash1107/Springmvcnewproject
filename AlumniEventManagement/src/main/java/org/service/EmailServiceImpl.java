/*
 * package org.service;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.mail.SimpleMailMessage; import
 * org.springframework.mail.javamail.JavaMailSender; import
 * org.springframework.stereotype.Service;
 * 
 * @Service public class EmailServiceImpl {
 * 
 * @Autowired private JavaMailSender emailSender;
 * 
 * public void sendFeedbackNotification(String adminEmail, String
 * feedbackDetails) { SimpleMailMessage message = new SimpleMailMessage();
 * message.setTo(adminEmail); message.setSubject("New Feedback Submitted");
 * message.setText("A new feedback has been submitted:\n\n" + feedbackDetails);
 * 
 * emailSender.send(message); } }
 */