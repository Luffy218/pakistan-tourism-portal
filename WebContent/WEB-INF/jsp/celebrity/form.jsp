<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>${celebrity == null ? 'Add New' : 'Edit'} Celebrity - Pakistan Tourism Portal</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body class="bg-gray-50">
<jsp:include page="../header.jsp" />

<div class="container mx-auto px-4 py-16">
  <div class="max-w-3xl mx-auto">
    <nav class="flex mb-8 text-gray-600" aria-label="Breadcrumb">
      <ol class="inline-flex items-center space-x-2">
        <li><a href="${pageContext.request.contextPath}/" class="hover:text-pak-green"><i class="fas fa-home mr-2"></i>Home</a></li>
        <li><span class="mx-2">/</span><a href="${pageContext.request.contextPath}/celebrities" class="hover:text-pak-green">Celebrities</a></li>
        <li><span class="mx-2">/</span><span class="text-gray-400">${celebrity == null ? 'Add New Celebrity' : 'Edit Celebrity'}</span></li>
      </ol>
    </nav>

    <div class="bg-white rounded-xl shadow-lg p-8">
      <h1 class="text-2xl font-bold text-pak-green mb-6">${celebrity == null ? 'Add New Celebrity' : 'Edit Celebrity'}</h1>

      <c:if test="${not empty error}">
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-6" role="alert">
          <span class="block sm:inline">${error}</span>
        </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/celebrities${celebrity == null ? '' : '/update'}" 
            method="POST" class="space-y-6" onsubmit="return validateForm()">
        
        <c:if test="${celebrity != null}">
          <input type="hidden" name="id" value="${celebrity.id}" />
        </c:if>

        <div>
          <label for="name" class="block text-gray-700 text-sm font-semibold mb-2">
            Name <span class="text-red-500">*</span>
          </label>
          <input type="text" id="name" name="name" required
                 value="${celebrity.name}"
                 class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                 placeholder="Enter celebrity name" />
        </div>

        <div>
          <label for="profession" class="block text-gray-700 text-sm font-semibold mb-2">
            Profession <span class="text-red-500">*</span>
          </label>
          <select id="profession" name="profession" required
                  class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green">
            <option value="">Select a profession</option>
            <option value="Singer" ${celebrity.profession == 'Singer' ? 'selected' : ''}>Singer</option>
            <option value="Actor" ${celebrity.profession == 'Actor' ? 'selected' : ''}>Actor</option>
            <option value="Musician" ${celebrity.profession == 'Musician' ? 'selected' : ''}>Musician</option>
            <option value="Composer" ${celebrity.profession == 'Composer' ? 'selected' : ''}>Composer</option>
            <option value="Director" ${celebrity.profession == 'Director' ? 'selected' : ''}>Director</option>
          </select>
        </div>

        <div>
          <label for="bio" class="block text-gray-700 text-sm font-semibold mb-2">
            Biography <span class="text-red-500">*</span>
          </label>
          <textarea id="bio" name="bio" required rows="6"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                    placeholder="Enter celebrity biography">${celebrity.bio}</textarea>
        </div>

        <div>
          <label for="imageUrl" class="block text-gray-700 text-sm font-semibold mb-2">
            Image URL <span class="text-red-500">*</span>
          </label>
          <input type="url" id="imageUrl" name="imageUrl" required
                 value="${celebrity.imageUrl}"
                 class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                 placeholder="Enter image URL" />
          <p class="mt-1 text-sm text-gray-500">Please provide a direct link to the image</p>
        </div>

        <div>
          <label for="achievements" class="block text-gray-700 text-sm font-semibold mb-2">
            Achievements
          </label>
          <textarea id="achievements" name="achievements" rows="4"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                    placeholder="Enter celebrity achievements">${celebrity.achievements}</textarea>
        </div>

        <div>
          <label for="birthDate" class="block text-gray-700 text-sm font-semibold mb-2">
            Birth Date <span class="text-red-500">*</span>
          </label>
          <input type="date" id="birthDate" name="birthDate" required
                 value="${celebrity.birthDate}"
                 class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green" />
        </div>

        <div>
          <label for="birthPlace" class="block text-gray-700 text-sm font-semibold mb-2">
            Birth Place <span class="text-red-500">*</span>
          </label>
          <input type="text" id="birthPlace" name="birthPlace" required
                 value="${celebrity.birthPlace}"
                 class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-pak-green"
                 placeholder="Enter birth place" />
        </div>

        <div class="flex justify-end space-x-4 pt-6">
          <a href="${pageContext.request.contextPath}/celebrities" 
             class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition duration-300">
            Cancel
          </a>
          <button type="submit" 
                  class="px-6 py-2 bg-pak-green text-white rounded-lg hover:bg-opacity-90 transition duration-300">
            ${celebrity == null ? 'Create' : 'Update'} Celebrity
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="../footer.jsp" />

<script>
function validateForm() {
    const name = document.getElementById('name').value.trim();
    const profession = document.getElementById('profession').value;
    const bio = document.getElementById('bio').value.trim();
    const birthDate = document.getElementById('birthDate').value;
    const birthPlace = document.getElementById('birthPlace').value.trim();
    
    if (!name || !profession || !bio || !birthDate || !birthPlace) {
        alert('Please fill in all required fields.');
        return false;
    }
    
    const birthDateObj = new Date(birthDate);
    const today = new Date();
    if (birthDateObj > today) {
        alert('Birth date cannot be in the future.');
        return false;
    }
    
    return true;
}
</script>
</body>
</html>
