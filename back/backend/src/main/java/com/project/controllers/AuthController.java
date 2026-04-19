package com.project.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.models.ERole;
import com.project.models.Equipe;
import com.project.models.Joueur;
import com.project.models.Role;
import com.project.models.User;
import com.project.payload.request.LoginRequest;
import com.project.payload.request.SignupRequest;
import com.project.payload.response.JwtResponse;
import com.project.payload.response.MessageResponse;
import com.project.repository.EquipeRepository;
import com.project.repository.JoueurRepository;
import com.project.repository.RoleRepository;
import com.project.repository.UserRepository;
import com.project.security.jwt.JwtUtils;
import com.project.security.services.UserDetailsImpl;
import com.project.service.EquipeService;
import com.project.service.JoueurService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	UserRepository userRepository;
	@Autowired
	JoueurService joueurService;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	EquipeService equipeService;
	@Autowired
	EquipeRepository equipeRepo ; 
	@Autowired
	JoueurRepository joueurRepo ;

	@Autowired
	JwtUtils jwtUtils;

	@PostMapping("/signin")
	public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername()
						, loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();		
		List<String> roles = userDetails.getAuthorities().stream()
				.map(item -> item.getAuthority())
				.collect(Collectors.toList());

		return ResponseEntity.ok(new JwtResponse(jwt, 
												 userDetails.getId(), 
												 userDetails.getUsername(), 
												 userDetails.getEmail(), 
												 roles));
	}

	@PostMapping("/signup")
	public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {
		if (userRepository.existsByUsername(signUpRequest.getUsername())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse("Error: Username is already taken!"));
		}

		if (userRepository.existsByEmail(signUpRequest.getEmail())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse("Error: Email is already in use!"));
		}
		User user = new User(
					null,
					signUpRequest.getUsername(), 
					signUpRequest.getEmail(),
					encoder.encode(signUpRequest.getPassword()),
					signUpRequest.getPhone(),
					signUpRequest.getAge(),
					null
				 );

		Set<String> strRoles = signUpRequest.getRole();
		Set<Role> roles = new HashSet<>();

		if (strRoles == null) {
			Role joueurRole = roleRepository.findByName(ERole.ROLE_JOUEUR)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(joueurRole);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);
					break;
				case "parent":
					Role parentRole = roleRepository.findByName(ERole.ROLE_PARENT)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(parentRole);
					break;
				case "coach":
					Role coachRole = roleRepository.findByName(ERole.ROLE_COACH)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(coachRole);
					break;
				default:
					Role joueurRole = roleRepository.findByName(ERole.ROLE_JOUEUR)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(joueurRole);
				}
			});
		}

		
		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}
}
