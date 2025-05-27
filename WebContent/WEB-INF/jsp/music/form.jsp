<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${music == null ? 'Add New' : 'Edit'} Music - Pakistan Tourism Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="bg-gray-50">
    <jsp:include page="../header.jsp" />

    <div class="container mx-auto px-4 py-16">
        <div class="max-w-3xl mx-auto">
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
                        <span class="text-gray-400">
                            ${music == null ? 'Add New Music' : 'Edit Music'}
                        </span>
                    </li>
                </ol>
            </nav>

            <!-- Form Card -->
            <div class="bg-white rounded-xl shadow-lg p-8">
                <h1 class="text-2xl font-bold text-pak-green mb-6">
                    ${music == null ? 'Add New Music' : 'Edit Music'}
                </h1>

                <!-- Error Message Display -->
                <c:if test="${not empty error}">
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-6" role="alert">
                        <span class="block sm:inline">${error}</span>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/music${music == null ? '' : '/update'}" 
                      method="POST" class="space-y-6" onsubmit="return validateForm()">
                    
                    <c:if test="${music != null}">
                        <input type="hidden" name="id" value="${music.id}">
                    </c:if>

                    <!-- Title -->
                    <div>
                        <label for="title" class="block text-gray-700 text-sm font-semibold mb-2">
                            Title <span class="text-red-500">*</span>
                        </label>
                        <input type="text" id="title" name="title" required
                               value="${music.title}"
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                               placeholder="Enter music title">
                    </div>

                    <!-- Description -->
                    <div>
                        <label for="description" class="block text-gray-700 text-sm font-semibold mb-2">
                            Description <span class="text-red-500">*</span>
                        </label>
                        <textarea id="description" name="description" required rows="4"
                                  class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                                  placeholder="Enter music description">${music.description}</textarea>
                    </div>

                    <!-- Image URL -->
                    <div>
                        <label for="imageUrl" class="block text-gray-700 text-sm font-semibold mb-2">
                            Image URL <span class="text-red-500">*</span>
                        </label>
                        <input type="url" id="imageUrl" name="imageUrl" required
                               value="${music.imageUrl}"
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                               placeholder="Enter image URL">
                        <p class="mt-1 text-sm text-gray-500">Please provide a direct link to the image</p>
                    </div>

                    <!-- Audio URL -->
                    <div>
                        <label for="audioUrl" class="block text-gray-700 text-sm font-semibold mb-2">
                            Audio URL <span class="text-red-500">*</span>
                        </label>
                        <input type="url" id="audioUrl" name="audioUrl" required
                               value="${music.audioUrl}"
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                               placeholder="Enter audio URL">
                        <p class="mt-1 text-sm text-gray-500">Please provide a direct link to the audio file</p>
                    </div>

                    <!-- Celebrity -->
                    <div>
                        <label for="celebrityId" class="block text-gray-700 text-sm font-semibold mb-2">
                            Artist <span class="text-red-500">*</span>
                        </label>
                        <select id="celebrityId" name="celebrityId" required
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green">
                            <option value="">Select an artist</option>
                            <c:forEach var="celebrity" items="${celebrities}">
                                <option value="${celebrity.id}" ${music.celebrityId == celebrity.id ? 'selected' : ''}>
                                    ${celebrity.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Genre -->
                    <div>
                        <label for="genre" class="block text-gray-700 text-sm font-semibold mb-2">
                            Genre <span class="text-red-500">*</span>
                        </label>
                        <select id="genre" name="genre" required
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green">
                            <option value="">Select a genre</option>
                            <option value="Classical" ${music.genre == 'Classical' ? 'selected' : ''}>Classical</option>
                            <option value="Pop" ${music.genre == 'Pop' ? 'selected' : ''}>Pop</option>
                            <option value="Folk" ${music.genre == 'Folk' ? 'selected' : ''}>Folk</option>
                            <option value="Sufi" ${music.genre == 'Sufi' ? 'selected' : ''}>Sufi</option>
                            <option value="Modern" ${music.genre == 'Modern' ? 'selected' : ''}>Modern</option>
                        </select>
                    </div>

                    <!-- Release Year -->
                    <div>
                        <label for="releaseYear" class="block text-gray-700 text-sm font-semibold mb-2">
                            Release Year <span class="text-red-500">*</span>
                        </label>
                        <input type="number" id="releaseYear" name="releaseYear" required
                               value="${music.releaseYear}"
                               min="1900" max="2024"
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                               placeholder="Enter release year">
                    </div>

                    <!-- Form Actions -->
                    <div class="flex justify-end space-x-4 pt-6">
                        <a href="${pageContext.request.contextPath}/music" 
                           class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition duration-300">
                            Cancel
                        </a>
                        <button type="submit" 
                                class="px-6 py-2 bg-pak-green text-white rounded-lg hover:bg-opacity-90 transition duration-300">
                            ${music == null ? 'Create' : 'Update'} Music
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../footer.jsp" />

    <script>
        function validateForm() {
            const releaseYear = document.getElementById('releaseYear').value;
            const currentYear = new Date().getFullYear();
            
            if (releaseYear < 1900 || releaseYear > currentYear) {
                alert('Please enter a valid release year between 1900 and ' + currentYear);
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html>
