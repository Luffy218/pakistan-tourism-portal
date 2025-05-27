<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp" />

<!-- Hero Section -->
<div class="bg-pak-green text-white py-16 mt-16">
    <div class="container mx-auto px-4 text-center">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">Pakistani Celebrities</h1>
        <p class="text-xl opacity-90">Discover the talented artists and personalities of Pakistan</p>
    </div>
</div>

<!-- Quick Filter Bar -->
<div class="bg-white shadow-md py-4 mb-8">
    <div class="container mx-auto px-4">
        <div class="flex flex-wrap justify-center gap-6">
            <a href="${pageContext.request.contextPath}/celebrities?category=all" 
               class="flex items-center gap-2 px-4 py-2 rounded-full ${empty param.category ? 'bg-pak-green text-white' : 'text-gray-600 hover:text-pak-green'} transition-colors">
                <i class="fas fa-users"></i>
                <span>All</span>
            </a>
            <a href="${pageContext.request.contextPath}/celebrities?category=film" 
               class="flex items-center gap-2 px-4 py-2 rounded-full ${param.category == 'film' ? 'bg-pak-green text-white' : 'text-gray-600 hover:text-pak-green'} transition-colors">
                <i class="fas fa-film"></i>
                <span>Film</span>
            </a>
            <a href="${pageContext.request.contextPath}/celebrities?category=television" 
               class="flex items-center gap-2 px-4 py-2 rounded-full ${param.category == 'television' ? 'bg-pak-green text-white' : 'text-gray-600 hover:text-pak-green'} transition-colors">
                <i class="fas fa-tv"></i>
                <span>Television</span>
            </a>
            <a href="${pageContext.request.contextPath}/celebrities?category=music" 
               class="flex items-center gap-2 px-4 py-2 rounded-full ${param.category == 'music' ? 'bg-pak-green text-white' : 'text-gray-600 hover:text-pak-green'} transition-colors">
                <i class="fas fa-music"></i>
                <span>Music</span>
            </a>
            <a href="${pageContext.request.contextPath}/celebrities?category=sports" 
               class="flex items-center gap-2 px-4 py-2 rounded-full ${param.category == 'sports' ? 'bg-pak-green text-white' : 'text-gray-600 hover:text-pak-green'} transition-colors">
                <i class="fas fa-running"></i>
                <span>Sports</span>
            </a>
            <a href="${pageContext.request.contextPath}/celebrities?category=literature" 
               class="flex items-center gap-2 px-4 py-2 rounded-full ${param.category == 'literature' ? 'bg-pak-green text-white' : 'text-gray-600 hover:text-pak-green'} transition-colors">
                <i class="fas fa-book"></i>
                <span>Literature</span>
            </a>
        </div>
    </div>
</div>

<!-- Statistics Section -->
<div class="container mx-auto px-4 -mt-8">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div class="bg-white p-6 rounded-lg shadow-lg text-center transform hover:-translate-y-1 transition-transform duration-300">
            <div class="text-3xl font-bold text-pak-green mb-2">${actorCount}</div>
            <div class="text-gray-600">Actors</div>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg text-center transform hover:-translate-y-1 transition-transform duration-300">
            <div class="text-3xl font-bold text-pak-green mb-2">${singerCount}</div>
            <div class="text-gray-600">Singers</div>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg text-center transform hover:-translate-y-1 transition-transform duration-300">
            <div class="text-3xl font-bold text-pak-green mb-2">${musicianCount}</div>
            <div class="text-gray-600">Musicians</div>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg text-center transform hover:-translate-y-1 transition-transform duration-300">
            <div class="text-3xl font-bold text-pak-green mb-2">${totalCount}</div>
            <div class="text-gray-600">Total Celebrities</div>
        </div>
    </div>
</div>

<!-- Search and Filter Section -->
<div class="container mx-auto px-4 py-8">
    <div class="flex flex-col md:flex-row gap-6 items-center justify-between">
        <!-- Search Form -->
        <form action="${pageContext.request.contextPath}/celebrities" method="GET" class="w-full md:w-96">
            <div class="relative">
                <input type="text" 
                       name="search" 
                       placeholder="Search celebrities..." 
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pak-green"
                       value="${param.search}">
                <button type="submit" class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-pak-green">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>

        <!-- Sort Options -->
        <div class="flex items-center gap-2">
            <span class="text-gray-600">Sort by:</span>
            <select name="sort" 
                    onchange="window.location.href=this.value"
                    class="px-3 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pak-green">
                <option value="${pageContext.request.contextPath}/celebrities?sort=name" ${param.sort == 'name' ? 'selected' : ''}>
                    Name
                </option>
                <option value="${pageContext.request.contextPath}/celebrities?sort=profession" ${param.sort == 'profession' ? 'selected' : ''}>
                    Profession
                </option>
                <option value="${pageContext.request.contextPath}/celebrities?sort=popularity" ${param.sort == 'popularity' ? 'selected' : ''}>
                    Popularity
                </option>
            </select>
        </div>

        <!-- Admin Actions -->
        <c:if test="${sessionScope.user.admin}">
            <a href="${pageContext.request.contextPath}/celebrities/add" 
               class="btn-pak-primary whitespace-nowrap">
                <i class="fas fa-plus mr-2"></i> Add Celebrity
            </a>
        </c:if>
    </div>
</div>

<!-- Celebrities Grid -->
<div class="container mx-auto px-4 pb-16">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="celebrity" items="${celebrityList}">
            <div class="bg-white rounded-xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                <div class="relative h-64">
                    <c:choose>
                        <c:when test="${empty celebrity.imageUrl}">
                            <img src="https://images.unsplash.com/photo-1511367461989-f85a21fda167" 
                                 alt="${celebrity.name}" 
                                 class="w-full h-full object-cover">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/uploads/${celebrity.imageUrl}" 
                                 alt="${celebrity.name}" 
                                 class="w-full h-full object-cover">
                        </c:otherwise>
                    </c:choose>
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                    <div class="absolute bottom-4 left-4 text-white">
                        <h3 class="text-xl font-semibold">${celebrity.name}</h3>
                        <p class="text-sm opacity-90">${celebrity.profession}</p>
                    </div>
                </div>
                <div class="p-6">
                    <p class="text-gray-600 mb-4 line-clamp-3">${celebrity.bio}</p>
                    <div class="flex justify-between items-center">
                        <span class="text-sm text-gray-500">
                            <i class="fas fa-map-marker-alt mr-2"></i>${celebrity.birthPlace}
                        </span>
                        <div class="flex items-center gap-4">
                            <a href="${pageContext.request.contextPath}/celebrities/view/${celebrity.id}" 
                               class="text-pak-green hover:text-pak-gold transition-colors">
                                View Profile <i class="fas fa-arrow-right ml-2"></i>
                            </a>
                            <c:if test="${sessionScope.user.admin}">
                                <div class="flex gap-2">
                                    <a href="${pageContext.request.contextPath}/celebrities/edit?id=${celebrity.id}" 
                                       class="text-pak-green hover:text-pak-gold transition-colors">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="${pageContext.request.contextPath}/celebrities/delete" 
                                          method="POST" 
                                          style="display: inline;"
                                          onsubmit="return confirm('Are you sure you want to delete this celebrity?');">
                                        <input type="hidden" name="id" value="${celebrity.id}">
                                        <button type="submit" class="text-red-600 hover:text-red-700 transition-colors">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty celebrityList}">
            <div class="col-span-full text-center py-16">
                <i class="fas fa-user-tie text-5xl text-gray-300 mb-4"></i>
                <p class="text-gray-500 text-lg">No celebrities found matching your criteria.</p>
                <a href="${pageContext.request.contextPath}/celebrities" 
                   class="inline-block mt-4 text-pak-green hover:text-pak-gold transition-colors">
                    View all celebrities
                </a>
            </div>
        </c:if>
    </div>

    <!-- Pagination -->
    <c:if test="${not empty celebrityList}">
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
    </c:if>
</div>

<!-- Newsletter Section -->
<div class="bg-pak-green py-16">
    <div class="container mx-auto px-4">
        <div class="max-w-2xl mx-auto text-center">
            <h3 class="text-2xl font-bold text-white mb-4">Stay Updated</h3>
            <p class="text-white/80 mb-8">Get notifications about new celebrity profiles and updates</p>
            <form action="${pageContext.request.contextPath}/newsletter/subscribe" 
                  method="POST" 
                  id="newsletterForm"
                  onsubmit="handleSubscribe(event)"
                  class="flex flex-col sm:flex-row gap-4 justify-center"
                  novalidate>
                <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
                <input type="email" 
                       name="email" 
                       id="newsletterEmail"
                       placeholder="Enter your email" 
                       required
                       aria-label="Email address for newsletter"
                       aria-describedby="emailHelp"
                       class="px-6 py-3 rounded-lg flex-1 max-w-md focus:outline-none focus:ring-2 focus:ring-pak-gold"
                       onkeydown="if(event.key === 'Enter') handleSubscribe(event)">
                <span id="emailHelp" class="sr-only">
                    Enter your email address to subscribe to our newsletter
                </span>
                <button type="submit" 
                        id="subscribeBtn"
                        aria-label="Subscribe to newsletter"
                        class="px-8 py-3 bg-pak-gold text-white rounded-lg hover:bg-opacity-90 transition-colors">
                    <span class="inline-flex items-center">
                        <span class="subscribe-text">Subscribe</span>
                        <span class="loading-spinner hidden ml-2">
                            <i class="fas fa-circle-notch fa-spin"></i>
                        </span>
                    </span>
                </button>
            </form>
            <p class="text-white/60 text-sm mt-4">We respect your privacy. Unsubscribe at any time.</p>
            
            <!-- Status Messages -->
            <div id="subscribeSuccess" 
                 class="hidden"
                 role="status"
                 aria-live="polite">
                <div class="mt-4 inline-flex items-center text-white bg-green-500/20 px-4 py-2 rounded-lg">
                    <i class="fas fa-check mr-2"></i>
                    <span>Successfully subscribed! Check your email for confirmation.</span>
                </div>
            </div>
            <div id="subscribeError" 
                 class="hidden"
                 role="alert"
                 aria-live="assertive">
                <div class="mt-4 inline-flex items-center text-white bg-red-500/20 px-4 py-2 rounded-lg">
                    <i class="fas fa-exclamation-circle mr-2"></i>
                    <span>Oops! Something went wrong. Please try again.</span>
                </div>
            </div>
            
            <script>
            function showMessage(elementId, duration = 5000) {
                const element = document.getElementById(elementId);
                element.classList.remove('hidden');
                setTimeout(() => {
                    element.classList.add('hidden');
                }, duration);
            }
            
            async function handleSubscribe(event) {
                // Prevent double submission
                const form = document.getElementById('newsletterForm');
                if (form.dataset.submitting === 'true') {
                    return;
                }
                event.preventDefault();
                
                const btn = document.getElementById('subscribeBtn');
                const spinner = btn.querySelector('.loading-spinner');
                const text = btn.querySelector('.subscribe-text');
                const emailInput = document.getElementById('newsletterEmail');
                const email = emailInput.value.trim();
                
                // Email validation using regex
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!email || !emailRegex.test(email)) {
                    showMessage('subscribeError');
                    return;
                }
                
                // Set submitting state
                form.dataset.submitting = 'true';
                spinner.classList.remove('hidden');
                text.textContent = 'Subscribing...';
                btn.disabled = true;
                emailInput.disabled = true;
                
                try {
                    // Submit the form
                    const formData = new FormData(form);
                    const response = await fetch(form.action, {
                        method: 'POST',
                        body: formData
                    });
                    
                    if (response.ok) {
                        // Show success message
                        showMessage('subscribeSuccess');
                        form.reset();
                    } else {
                        throw new Error('Subscription failed');
                    }
                } catch (error) {
                    // Show error message
                    showMessage('subscribeError');
                } finally {
                    // Reset form state
                    form.dataset.submitting = 'false';
                    spinner.classList.add('hidden');
                    text.textContent = 'Subscribe';
                    btn.disabled = false;
                    emailInput.disabled = false;
                    emailInput.focus();
                }
            }
            </script>
        </div>
    </div>
</div>

<!-- Social Sharing -->
<div class="bg-white py-12 border-t border-gray-100">
    <div class="container mx-auto px-4">
        <div class="text-center">
            <h3 class="text-2xl font-bold text-gray-800 mb-6">Share Pakistani Celebrities</h3>
            <p class="text-gray-600 mb-8">Help others discover Pakistan's amazing talent</p>
            <div class="flex justify-center gap-4">
                <a href="https://www.facebook.com/sharer/sharer.php?u=${pageContext.request.requestURL}"
                   target="_blank"
                   class="w-12 h-12 rounded-full bg-[#1877f2] text-white flex items-center justify-center hover:opacity-90 transition-opacity">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="https://twitter.com/intent/tweet?url=${pageContext.request.requestURL}&text=Discover%20Pakistani%20Celebrities"
                   target="_blank"
                   class="w-12 h-12 rounded-full bg-[#1da1f2] text-white flex items-center justify-center hover:opacity-90 transition-opacity">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="https://www.linkedin.com/shareArticle?mini=true&url=${pageContext.request.requestURL}"
                   target="_blank"
                   class="w-12 h-12 rounded-full bg-[#0077b5] text-white flex items-center justify-center hover:opacity-90 transition-opacity">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a href="https://api.whatsapp.com/send?text=Check%20out%20Pakistani%20Celebrities:%20${pageContext.request.requestURL}"
                   target="_blank"
                   class="w-12 h-12 rounded-full bg-[#25d366] text-white flex items-center justify-center hover:opacity-90 transition-opacity">
                    <i class="fab fa-whatsapp"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp" />
