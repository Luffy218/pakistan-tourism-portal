<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<!-- Category Header -->
<div class="bg-pak-green text-white py-16 mt-16">
    <div class="container mx-auto px-4">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">Pakistani Music</h1>
        <p class="text-xl opacity-90">Experience the rich musical heritage and contemporary sounds of Pakistan</p>
        
        <!-- Filter Section -->
        <div class="mt-8 flex flex-wrap gap-4">
            <button class="px-4 py-2 bg-white text-pak-green rounded-lg hover:bg-pak-gold transition duration-300">
                All
            </button>
            <button class="px-4 py-2 bg-white bg-opacity-10 text-white rounded-lg hover:bg-pak-gold hover:text-pak-green transition duration-300">
                Qawwali
            </button>
            <button class="px-4 py-2 bg-white bg-opacity-10 text-white rounded-lg hover:bg-pak-gold hover:text-pak-green transition duration-300">
                Pop
            </button>
            <button class="px-4 py-2 bg-white bg-opacity-10 text-white rounded-lg hover:bg-pak-gold hover:text-pak-green transition duration-300">
                Folk
            </button>
            <button class="px-4 py-2 bg-white bg-opacity-10 text-white rounded-lg hover:bg-pak-gold hover:text-pak-green transition duration-300">
                Classical
            </button>
            <button class="px-4 py-2 bg-white bg-opacity-10 text-white rounded-lg hover:bg-pak-gold hover:text-pak-green transition duration-300">
                Modern
            </button>
        </div>
    </div>
</div>

<!-- Search and Sort Section -->
<div class="container mx-auto px-4 py-8">
    <div class="flex flex-col md:flex-row justify-between items-center gap-4">
        <!-- Search -->
        <div class="relative w-full md:w-96">
            <input type="text" 
                   placeholder="Search artists, songs, or albums..." 
                   class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pak-green"
            >
            <button class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400">
                <i class="fas fa-search"></i>
            </button>
        </div>
        
        <!-- Sort -->
        <div class="flex items-center gap-2">
            <span class="text-gray-600">Sort by:</span>
            <select class="px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pak-green">
                <option value="popular">Most Popular</option>
                <option value="latest">Latest</option>
                <option value="artist">Artist</option>
                <option value="title">Title</option>
            </select>
        </div>
    </div>
</div>

<!-- Music Grid -->
<div class="container mx-auto px-4 pb-16">
    <div class="card-grid">
        <c:forEach var="music" items="${musicList}" varStatus="status">
            <div class="card fade-in delay-${status.index % 6}">
                <img src="${music.coverUrl}" alt="${music.title}" class="card-image">
                <div class="card-content">
                    <span class="category-tag">${music.genre}</span>
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <h3 class="text-xl font-bold">${music.title}</h3>
                            <p class="text-gray-500">${music.artist}</p>
                        </div>
                        <div class="flex items-center text-yellow-500">
                            <i class="fas fa-star"></i>
                            <span class="ml-1 text-gray-600">${music.rating}</span>
                        </div>
                    </div>
                    <p class="text-gray-600 mb-4">${music.description}</p>
                    <div class="flex justify-between items-center">
                        <a href="${pageContext.request.contextPath}/music/${music.id}" class="btn-pak-primary">
                            Listen Now
                        </a>
                        <div class="flex items-center space-x-3">
                            <div class="flex items-center text-gray-600">
                                <i class="fas fa-headphones mr-1"></i>
                                <span>${music.plays}</span>
                            </div>
                            <div class="flex items-center text-gray-600">
                                <i class="fas fa-clock mr-1"></i>
                                <span>${music.duration}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <!-- Placeholder Card -->
        <div class="card fade-in delay-0">
            <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Dil Dil Pakistan" class="card-image">
            <div class="card-content">
                <span class="category-tag">Pop</span>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <h3 class="text-xl font-bold">Dil Dil Pakistan</h3>
                        <p class="text-gray-500">Vital Signs</p>
                    </div>
                    <div class="flex items-center text-yellow-500">
                        <i class="fas fa-star"></i>
                        <span class="ml-1 text-gray-600">4.9</span>
                    </div>
                </div>
                <p class="text-gray-600 mb-4">An iconic patriotic song that has become Pakistan's unofficial national anthem.</p>
                <div class="flex justify-between items-center">
                    <a href="${pageContext.request.contextPath}/music/dil-dil-pakistan" class="btn-pak-primary">
                        Listen Now
                    </a>
                    <div class="flex items-center space-x-3">
                        <div class="flex items-center text-gray-600">
                            <i class="fas fa-headphones mr-1"></i>
                            <span>1.2M</span>
                        </div>
                        <div class="flex items-center text-gray-600">
                            <i class="fas fa-clock mr-1"></i>
                            <span>4:32</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pagination -->
    <div class="mt-12 flex justify-center">
        <nav class="flex items-center space-x-2">
            <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">
                <i class="fas fa-chevron-left"></i>
            </button>
            <button class="px-4 py-2 border border-pak-green bg-pak-green text-white rounded-lg">1</button>
            <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">2</button>
            <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">3</button>
            <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">
                <i class="fas fa-chevron-right"></i>
            </button>
        </nav>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />
