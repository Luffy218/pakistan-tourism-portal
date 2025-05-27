<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>${celebrity.name} - Pakistani Celebrities</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body class="bg-gray-50">
<jsp:include page="../header.jsp" />

<div class="container mx-auto px-4 py-16">
  <nav class="flex mb-8 text-gray-600" aria-label="Breadcrumb">
    <ol class="inline-flex items-center space-x-2">
      <li><a href="${pageContext.request.contextPath}/" class="hover:text-pak-green"><i class="fas fa-home mr-2"></i>Home</a></li>
      <li><span class="mx-2">/</span><a href="${pageContext.request.contextPath}/celebrities" class="hover:text-pak-green">Celebrities</a></li>
      <li><span class="mx-2">/</span><span class="text-gray-400">${celebrity.name}</span></li>
    </ol>
  </nav>

  <div class="bg-white rounded-xl shadow-lg overflow-hidden">
    <div class="relative h-96">
      <img src="${celebrity.imageUrl}" alt="${celebrity.name}" class="w-full h-full object-cover" />
      <div class="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent"></div>
      <div class="absolute bottom-8 left-8 text-white">
        <h1 class="text-4xl font-bold mb-2">${celebrity.name}</h1>
        <p class="text-xl opacity-90">${celebrity.profession}</p>
      </div>
    </div>

    <div class="p-8">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div class="flex items-center space-x-3">
          <i class="fas fa-map-marker-alt text-pak-green text-xl"></i>
          <div>
            <p class="text-sm text-gray-500">Birth Place</p>
            <p class="font-medium">${celebrity.birthPlace}</p>
          </div>
        </div>
        <div class="flex items-center space-x-3">
          <i class="fas fa-calendar text-pak-green text-xl"></i>
          <div>
            <p class="text-sm text-gray-500">Birth Date</p>
            <p class="font-medium">${celebrity.birthDate}</p>
          </div>
        </div>
        <div class="flex items-center space-x-3">
          <i class="fas fa-star text-pak-green text-xl"></i>
          <div>
            <p class="text-sm text-gray-500">Profession</p>
            <p class="font-medium">${celebrity.profession}</p>
          </div>
        </div>
      </div>

      <div class="mb-8">
        <h2 class="text-2xl font-bold text-pak-green mb-4">Biography</h2>
        <p class="text-gray-600 leading-relaxed whitespace-pre-line">${celebrity.bio}</p>
      </div>

      <div class="mb-8">
        <h2 class="text-2xl font-bold text-pak-green mb-4">Achievements</h2>
        <div class="bg-gray-50 rounded-lg p-6">
          <p class="text-gray-600 leading-relaxed whitespace-pre-line">${celebrity.achievements}</p>
        </div>
      </div>

      <c:if test="${not empty relatedMusic}">
        <div class="mb-8">
          <h2 class="text-2xl font-bold text-pak-green mb-4">Music</h2>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <c:forEach var="music" items="${relatedMusic}">
              <div class="bg-gray-50 rounded-lg p-4">
                <div class="flex items-center space-x-4">
                  <img src="${music.imageUrl}" alt="${music.title}" class="w-16 h-16 rounded-lg object-cover" />
                  <div>
                    <h3 class="font-semibold">${music.title}</h3>
                    <p class="text-sm text-gray-500">${music.genre}</p>
                    <a href="${pageContext.request.contextPath}/music/view/${music.id}" class="text-pak-green hover:underline text-sm">Listen Now</a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </c:if>

      <c:if test="${sessionScope.user.role == 'admin'}">
        <div class="border-t pt-8 mt-8 flex justify-end space-x-4">
          <a href="${pageContext.request.contextPath}/celebrities/edit?id=${celebrity.id}" class="inline-flex items-center px-4 py-2 border border-pak-green text-pak-green rounded-lg hover:bg-pak-green hover:text-white transition duration-300">
            <i class="fas fa-edit mr-2"></i> Edit
          </a>
          <form action="${pageContext.request.contextPath}/celebrities/delete" method="POST" onsubmit="return confirm('Are you sure you want to delete this celebrity?');" class="inline">
            <input type="hidden" name="id" value="${celebrity.id}" />
            <button type="submit" class="inline-flex items-center px-4 py-2 border border-red-600 text-red-600 rounded-lg hover:bg-red-600 hover:text-white transition duration-300">
              <i class="fas fa-trash-alt mr-2"></i> Delete
            </button>
          </form>
        </div>
      </c:if>
    </div>
  </div>
</div>

<jsp:include page="../footer.jsp" />
</body>
</html>
