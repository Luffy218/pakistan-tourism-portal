<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${music.title} - Pakistani Music</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="bg-gray-50">
    <jsp:include page="../header.jsp" />

    <!-- Music Detail Section -->
    <div class="container mx-auto px-4 py-16">
        <div class="max-w-5xl mx-auto">
            <!-- Breadcrumb -->
            <nav class="flex mb-8 text-gray-600" aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-2">
                    <li class="inline-flex items-center">
                        <a href="${pageContext.request.contextPath}/" class="hover:text-pak-green">
                            <i class="fas fa-home mr-2"></i> Home
                        </a>
                    </li>
                    <li class="inline-flex items-center">
                        <span class="mx-2">/</span>
                        <a href="${pageContext.request.contextPath}/music" class="hover:text-pak-green">
                            Music
                        </a>
                    </li>
                    <li class="inline-flex items-center">
                        <span class="mx-2">/</span>
                        <span class="text-gray-400">${music.title}</span>
                    </li>
                </ol>
            </nav>

            <!-- Music Content -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <div class="relative h-96">
                    <img src="${music.imageUrl}" alt="${music.title}" class="w-full h-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                    <div class="absolute bottom-0 left-0 p-8 text-white">
                        <span class="bg-pak-green px-3 py-1 rounded-full text-sm mb-4 inline-block">
                            ${music.genre}
                        </span>
                        <h1 class="text-4xl font-bold mb-2">${music.title}</h1>
                        <p class="text-lg opacity-90">Released in ${music.releaseYear}</p>
                    </div>
                </div>

                <div class="p-8">
                    <!-- Audio Player -->
                    <div class="mb-8">
                        <h3 class="text-xl font-semibold mb-4">Listen to the Music</h3>
                        <audio controls class="w-full">
                            <source src="${music.audioUrl}" type="audio/mpeg">
                            Your browser does not support the audio element.
                        </audio>
                    </div>

                    <!-- Description -->
                    <div class="mb-8">
                        <h3 class="text-xl font-semibold mb-4">About the Music</h3>
                        <p class="text-gray-600 leading-relaxed">${music.description}</p>
                    </div>

                    <!-- Artist Information -->
                    <div class="mb-8">
                        <h3 class="text-xl font-semibold mb-4">Artist</h3>
                        <div class="flex items-center space-x-4">
                            <img src="${celebrity.imageUrl}" alt="${celebrity.name}" 
                                 class="w-16 h-16 rounded-full object-cover">
                            <div>
                                <h4 class="font-semibold">${celebrity.name}</h4>
                                <p class="text-gray-600">${celebrity.profession}</p>
                            </div>
                        </div>
                    </div>

                    <!-- Admin Actions -->
                    <c:if test="${sessionScope.user.role == 'admin'}">
                        <div class="border-t pt-8 mt-8 flex justify-end space-x-4">
                            <a href="${pageContext.request.contextPath}/music/edit?id=${music.id}" 
                               class="inline-flex items-center px-4 py-2 border border-pak-green text-pak-green rounded-lg hover:bg-pak-green hover:text-white transition duration-300">
                                <i class="fas fa-edit mr-2"></i> Edit
                            </a>
                            <form action="${pageContext.request.contextPath}/music/delete" method="POST" 
                                  onsubmit="return confirm('Are you sure you want to delete this music entry?');"
                                  class="inline">
                                <input type="hidden" name="id" value="${music.id}">
                                <button type="submit" 
                                        class="inline-flex items-center px-4 py-2 border border-red-600 text-red-600 rounded-lg hover:bg-red-600 hover:text-white transition duration-300">
                                    <i class="fas fa-trash-alt mr-2"></i> Delete
                                </button>
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Related Music -->
            <div class="mt-16">
                <h2 class="text-2xl font-bold text-pak-green mb-8">More ${music.genre} Music</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <c:forEach var="relatedMusic" items="${relatedMusic}">
                        <div class="bg-white rounded-xl overflow-hidden shadow-lg card-hover">
                            <img src="${relatedMusic.imageUrl}" alt="${relatedMusic.title}" 
                                 class="w-full h-48 object-cover">
                            <div class="p-6">
                                <h3 class="text-xl font-semibold mb-2">${relatedMusic.title}</h3>
                                <p class="text-gray-600 mb-4 line-clamp-2">${relatedMusic.description}</p>
                                <a href="${pageContext.request.contextPath}/music/view/${relatedMusic.id}" 
                                   class="text-pak-green hover:underline">
                                    Learn More <i class="fas fa-arrow-right ml-2"></i>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../footer.jsp" />

    <script>
        // Add smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>
