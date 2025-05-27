</div> <!-- Close main content container -->
    
    <footer class="footer">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <!-- About Section -->
                <div>
                    <div class="flex items-center space-x-3 mb-6">
                        <div class="crescent"></div>
                        <h5 class="text-xl font-bold">About Us</h5>
                    </div>
                    <p class="text-gray-300 leading-relaxed">
                        Discover the beauty and culture of Pakistan through our comprehensive guide to food, 
                        attractions, entertainment, and sports. Experience the rich heritage and warm hospitality 
                        of our nation.
                    </p>
                </div>

                <!-- Quick Links -->
                <div>
                    <h5 class="text-xl font-bold mb-6">Explore</h5>
                    <ul class="space-y-3">
                        <li>
                            <a href="${pageContext.request.contextPath}/places" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-landmark mr-2"></i> Tourist Places
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/food" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-utensils mr-2"></i> Local Cuisine
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/culture" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-theater-masks mr-2"></i> Culture
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/events" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-calendar-alt mr-2"></i> Events
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Entertainment -->
                <div>
                    <h5 class="text-xl font-bold mb-6">Entertainment</h5>
                    <ul class="space-y-3">
                        <li>
                            <a href="${pageContext.request.contextPath}/movies" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-film mr-2"></i> Movies
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/music" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-music mr-2"></i> Music
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/sports" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-futbol mr-2"></i> Sports
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/celebrities" class="text-gray-300 hover:text-pak-gold transition duration-300 flex items-center">
                                <i class="fas fa-star mr-2"></i> Celebrities
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Newsletter -->
                <div>
                    <h5 class="text-xl font-bold mb-6">Stay Updated</h5>
                    <p class="text-gray-300 mb-4">Subscribe to our newsletter for the latest updates and travel tips.</p>
                    <form action="${pageContext.request.contextPath}/newsletter" method="POST" class="space-y-3">
                        <div class="relative">
                            <input type="email" 
                                   name="email" 
                                   placeholder="Enter your email" 
                                   required
                                   class="w-full px-4 py-2 bg-white bg-opacity-10 rounded-lg text-white placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-pak-gold"
                            >
                        </div>
                        <button type="submit" 
                                class="w-full px-4 py-2 bg-pak-gold text-pak-green rounded-lg font-semibold hover:bg-opacity-90 transition duration-300">
                            Subscribe
                        </button>
                    </form>
                </div>
            </div>

            <!-- Social Media Links -->
            <div class="mt-12 pt-8 border-t border-white border-opacity-20">
                <div class="flex justify-center space-x-6">
                    <a href="#" class="text-gray-300 hover:text-pak-gold transition duration-300">
                        <i class="fab fa-facebook-f text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-300 hover:text-pak-gold transition duration-300">
                        <i class="fab fa-twitter text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-300 hover:text-pak-gold transition duration-300">
                        <i class="fab fa-instagram text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-300 hover:text-pak-gold transition duration-300">
                        <i class="fab fa-youtube text-xl"></i>
                    </a>
                </div>
            </div>

            <!-- Copyright -->
            <div class="mt-8 text-center text-gray-300">
                <p>&copy; 2024 Pakistan Tourism Portal. All rights reserved.</p>
                <div class="flex justify-center space-x-4 mt-2 text-sm">
                    <a href="#" class="hover:text-pak-gold transition duration-300">Privacy Policy</a>
                    <span>|</span>
                    <a href="#" class="hover:text-pak-gold transition duration-300">Terms of Service</a>
                    <span>|</span>
                    <a href="#" class="hover:text-pak-gold transition duration-300">Sitemap</a>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
