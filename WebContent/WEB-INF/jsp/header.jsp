<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pakistan Tourism Portal</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <!-- Navigation -->
    <nav class="nav-container fixed w-full z-50">
        <div class="container mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-3">
                    <div class="crescent"></div>
                    <span class="text-xl font-bold text-white">Pakistan Tourism</span>
                </a>
                
                <div class="hidden md:flex space-x-8">
                    <a href="${pageContext.request.contextPath}/places" class="nav-link text-white">Places</a>
                    <a href="${pageContext.request.contextPath}/food" class="nav-link text-white">Food</a>
                    <a href="${pageContext.request.contextPath}/culture" class="nav-link text-white">Culture</a>
                    <a href="${pageContext.request.contextPath}/movies" class="nav-link text-white">Movies</a>
                    <a href="${pageContext.request.contextPath}/music" class="nav-link text-white">Music</a>
                    <a href="${pageContext.request.contextPath}/sports" class="nav-link text-white">Sports</a>
                    <a href="${pageContext.request.contextPath}/celebrities" class="nav-link text-white">Celebrities</a>
                </div>

                <div class="flex items-center space-x-4">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <div class="relative group">
                                <button class="flex items-center space-x-2 text-white focus:outline-none">
                                    <i class="fas fa-user-circle text-xl"></i>
                                    <span>${sessionScope.user.username}</span>
                                    <i class="fas fa-chevron-down text-sm"></i>
                                </button>
                                <div class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-xl py-2 hidden group-hover:block">
                                    <c:if test="${sessionScope.user.role == 'admin'}">
                                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="block px-4 py-2 text-pak-green hover:bg-gray-100">
                                            <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                                        </a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/profile" class="block px-4 py-2 text-pak-green hover:bg-gray-100">
                                        <i class="fas fa-user mr-2"></i> Profile
                                    </a>
                                    <c:if test="${sessionScope.user.role != 'tourist'}">
                                        <a href="${pageContext.request.contextPath}/my-comments" class="block px-4 py-2 text-pak-green hover:bg-gray-100">
                                            <i class="fas fa-comments mr-2"></i> My Comments
                                        </a>
                                    </c:if>
                                    <hr class="my-2 border-gray-200">
                                    <a href="${pageContext.request.contextPath}/auth?action=logout" class="block px-4 py-2 text-red-600 hover:bg-gray-100">
                                        <i class="fas fa-sign-out-alt mr-2"></i> Logout
                                    </a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login.jsp" class="btn-pak-outline text-white">
                                Login
                            </a>
                            <a href="${pageContext.request.contextPath}/register.jsp" class="btn-pak-primary">
                                Register
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Mobile Menu Button -->
                <button class="md:hidden text-white focus:outline-none" onclick="toggleMobileMenu()">
                    <i class="fas fa-bars text-2xl"></i>
                </button>
            </div>

            <!-- Mobile Menu -->
            <div id="mobileMenu" class="md:hidden hidden pb-4">
                <div class="flex flex-col space-y-4">
                    <a href="${pageContext.request.contextPath}/places" class="text-white hover:text-gray-200">Places</a>
                    <a href="${pageContext.request.contextPath}/food" class="text-white hover:text-gray-200">Food</a>
                    <a href="${pageContext.request.contextPath}/culture" class="text-white hover:text-gray-200">Culture</a>
                    <a href="${pageContext.request.contextPath}/movies" class="text-white hover:text-gray-200">Movies</a>
                    <a href="${pageContext.request.contextPath}/music" class="text-white hover:text-gray-200">Music</a>
                    <a href="${pageContext.request.contextPath}/sports" class="text-white hover:text-gray-200">Sports</a>
                    <a href="${pageContext.request.contextPath}/celebrities" class="text-white hover:text-gray-200">Celebrities</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <div class="absolute inset-0 flex items-center justify-center text-center z-10">
            <div class="text-white px-4">
                <h1 class="text-5xl md:text-6xl font-bold mb-4">Discover Pakistan</h1>
                <p class="text-xl md:text-2xl mb-8">Experience the beauty, culture, and heritage</p>
                
                <!-- Search Bar -->
                <div class="search-container">
                    <form action="${pageContext.request.contextPath}/search" method="GET" class="relative">
                        <input type="text" 
                               name="q"
                               placeholder="Search places, food, events..." 
                               class="w-full px-6 py-3 rounded-lg bg-white bg-opacity-90 focus:outline-none focus:ring-2 focus:ring-pak-green text-gray-800"
                        >
                        <button type="submit" class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-600 hover:text-pak-green">
                            <i class="fas fa-search text-xl"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content Container -->
    <div class="container mx-auto px-4 py-8">

<script>
    // Navigation background change on scroll
    window.addEventListener('scroll', function() {
        const nav = document.querySelector('.nav-container');
        if (window.scrollY > 50) {
            nav.classList.add('nav-scrolled');
        } else {
            nav.classList.remove('nav-scrolled');
        }
    });

    // Mobile menu toggle
    function toggleMobileMenu() {
        const mobileMenu = document.getElementById('mobileMenu');
        mobileMenu.classList.toggle('hidden');
    }
</script>
