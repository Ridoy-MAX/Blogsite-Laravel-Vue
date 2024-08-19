<!-- resources/js/Pages/Welcome.vue -->
<script setup>
import { Head, Link } from '@inertiajs/vue3';
import Layout from '@/Layouts/Index.vue';
import BlogCard from '../../../Components/BlogCard.vue';
import './Blog.css';
// Define props received from layout
defineProps({
    auth: Object,
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
});
</script>

<template>


    <div class="container  mt-3" id="blog">

        <div class="home_section_blog">
            <h2>New & Upcoming In Theaters
            </h2>

            <h1>We explore the latest trends in Movies</h1>


            <!-- <p>Flow Us</p> -->


            <div class='mt-5'>


            </div>
        </div>



    </div>
    <div class="container">
        <div class="row">
            <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            />
            <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            />
            <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            />
            <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            />
            <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            />
            <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            />
            <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            />
          
           

        



        </div>
    </div>

</template>
