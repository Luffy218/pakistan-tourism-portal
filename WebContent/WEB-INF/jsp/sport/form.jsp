<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty sport ? 'Add New' : 'Edit'} Sport - Tourism Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    
    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/sports">Sports</a></li>
                <li class="breadcrumb-item active">${empty sport ? 'Add New' : 'Edit'} Sport</li>
            </ol>
        </nav>

        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header">
                        <h4 class="mb-0">${empty sport ? 'Add New' : 'Edit'} Sport</h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/sports${empty sport ? '' : '/edit'}" 
                              method="post" enctype="multipart/form-data">
                            
                            <c:if test="${not empty sport}">
                                <input type="hidden" name="id" value="${sport.id}">
                            </c:if>

                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" 
                                       value="${sport.name}" required>
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" 
                                          rows="4" required>${sport.description}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="type" class="form-label">Type</label>
                                    <select class="form-select" id="type" name="type" required>
                                        <option value="">Select Type</option>
                                        <option value="Traditional" ${sport.type == 'Traditional' ? 'selected' : ''}>Traditional</option>
                                        <option value="Modern" ${sport.type == 'Modern' ? 'selected' : ''}>Modern</option>
                                        <option value="National" ${sport.type == 'National' ? 'selected' : ''}>National</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="popularity" class="form-label">Popularity</label>
                                    <select class="form-select" id="popularity" name="popularity" required>
                                        <option value="">Select Popularity</option>
                                        <option value="High" ${sport.popularity == 'High' ? 'selected' : ''}>High</option>
                                        <option value="Medium" ${sport.popularity == 'Medium' ? 'selected' : ''}>Medium</option>
                                        <option value="Low" ${sport.popularity == 'Low' ? 'selected' : ''}>Low</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="season" class="form-label">Best Season</label>
                                    <select class="form-select" id="season" name="season" required>
                                        <option value="">Select Season</option>
                                        <option value="Summer" ${sport.season == 'Summer' ? 'selected' : ''}>Summer</option>
                                        <option value="Winter" ${sport.season == 'Winter' ? 'selected' : ''}>Winter</option>
                                        <option value="All Year" ${sport.season == 'All Year' ? 'selected' : ''}>All Year</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="equipment" class="form-label">Required Equipment</label>
                                <textarea class="form-control" id="equipment" name="equipment" 
                                          rows="3">${sport.equipment}</textarea>
                            </div>

                            <div class="mb-3">
                                <label for="venues" class="form-label">Popular Venues</label>
                                <textarea class="form-control" id="venues" name="venues" 
                                          rows="3">${sport.venues}</textarea>
                            </div>

                            <div class="mb-3">
                                <label for="famousPlayers" class="form-label">Famous Players</label>
                                <textarea class="form-control" id="famousPlayers" name="famousPlayers" 
                                          rows="3">${sport.famousPlayers}</textarea>
                            </div>

                            <div class="mb-3">
                                <label for="image" class="form-label">Sport Image</label>
                                <input type="file" class="form-control" id="image" name="image" 
                                       accept="image/*" ${empty sport ? 'required' : ''}>
                                <c:if test="${not empty sport.imageUrl}">
                                    <small class="form-text text-muted">
                                        Current image: ${sport.imageUrl}. Upload new image to change.
                                    </small>
                                </c:if>
                            </div>

                            <div class="text-end">
                                <a href="${pageContext.request.contextPath}/sports" 
                                   class="btn btn-secondary me-2">Cancel</a>
                                <button type="submit" class="btn btn-primary">
                                    ${empty sport ? 'Add Sport' : 'Save Changes'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
