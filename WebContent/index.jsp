<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<!-- Featured Places Section -->
<section class="py-12">
    <div class="container mx-auto px-4">
        <h2 class="section-title text-3xl font-bold mb-8">Featured Destinations</h2>
        <div class="card-grid">
            <div class="card fade-in">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Badshahi Mosque" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Historical</span>
                    <h3 class="text-xl font-bold mb-2">Badshahi Mosque</h3>
                    <p class="text-gray-600 mb-4">Lahore's iconic mosque, a masterpiece of Mughal architecture.</p>
                    <a href="${pageContext.request.contextPath}/places/badshahi-mosque" class="btn-pak-primary inline-block">
                        Explore
                    </a>
                </div>
            </div>

            <div class="card fade-in" style="animation-delay: 0.2s">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Hunza Valley" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Nature</span>
                    <h3 class="text-xl font-bold mb-2">Hunza Valley</h3>
                    <p class="text-gray-600 mb-4">A paradise on Earth with breathtaking mountain views.</p>
                    <a href="${pageContext.request.contextPath}/places/hunza-valley" class="btn-pak-primary inline-block">
                        Explore
                    </a>
                </div>
            </div>

            <div class="card fade-in" style="animation-delay: 0.4s">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Mohenjo-daro" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Archaeological</span>
                    <h3 class="text-xl font-bold mb-2">Mohenjo-daro</h3>
                    <p class="text-gray-600 mb-4">Ancient ruins of one of the world's earliest urban civilizations.</p>
                    <a href="${pageContext.request.contextPath}/places/mohenjo-daro" class="btn-pak-primary inline-block">
                        Explore
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Food Section -->
<section class="py-12 bg-gray-50">
    <div class="container mx-auto px-4">
        <h2 class="section-title text-3xl font-bold mb-8">Pakistani Cuisine</h2>
        <div class="card-grid">
            <div class="card fade-in">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Biryani" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Main Course</span>
                    <h3 class="text-xl font-bold mb-2">Biryani</h3>
                    <p class="text-gray-600 mb-4">Aromatic rice dish with tender meat and exotic spices.</p>
                    <a href="${pageContext.request.contextPath}/food/biryani" class="btn-pak-primary inline-block">
                        Learn More
                    </a>
                </div>
            </div>

            <div class="card fade-in" style="animation-delay: 0.2s">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Karahi" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Traditional</span>
                    <h3 class="text-xl font-bold mb-2">Karahi</h3>
                    <p class="text-gray-600 mb-4">A spicy meat dish cooked in a traditional wok-like vessel.</p>
                    <a href="${pageContext.request.contextPath}/food/karahi" class="btn-pak-primary inline-block">
                        Learn More
                    </a>
                </div>
            </div>

            <div class="card fade-in" style="animation-delay: 0.4s">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Nihari" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Breakfast</span>
                    <h3 class="text-xl font-bold mb-2">Nihari</h3>
                    <p class="text-gray-600 mb-4">Slow-cooked meat stew, perfect for winter mornings.</p>
                    <a href="${pageContext.request.contextPath}/food/nihari" class="btn-pak-primary inline-block">
                        Learn More
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Culture & Entertainment -->
<section class="py-12">
    <div class="container mx-auto px-4">
        <h2 class="section-title text-3xl font-bold mb-8">Culture & Entertainment</h2>
        <div class="card-grid">
            <div class="card fade-in">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Qawwali" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Music</span>
                    <h3 class="text-xl font-bold mb-2">Qawwali</h3>
                    <p class="text-gray-600 mb-4">Traditional Sufi devotional music of South Asia.</p>
                    <a href="${pageContext.request.contextPath}/music/qawwali" class="btn-pak-primary inline-block">
                        Discover
                    </a>
                </div>
            </div>

            <div class="card fade-in" style="animation-delay: 0.2s">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Cricket" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Sports</span>
                    <h3 class="text-xl font-bold mb-2">Cricket</h3>
                    <p class="text-gray-600 mb-4">Pakistan's most beloved sport and national passion.</p>
                    <a href="${pageContext.request.contextPath}/sports/cricket" class="btn-pak-primary inline-block">
                        Discover
                    </a>
                </div>
            </div>

            <div class="card fade-in" style="animation-delay: 0.4s">
                <img src="https://images.unsplash.com/photo-1589782182703-2aaa69037b5b" alt="Cinema" class="card-image">
                <div class="card-content">
                    <span class="category-tag">Movies</span>
                    <h3 class="text-xl font-bold mb-2">Pakistani Cinema</h3>
                    <p class="text-gray-600 mb-4">The evolving landscape of Pakistan's film industry.</p>
                    <a href="${pageContext.request.contextPath}/movies" class="btn-pak-primary inline-block">
                        Discover
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />
