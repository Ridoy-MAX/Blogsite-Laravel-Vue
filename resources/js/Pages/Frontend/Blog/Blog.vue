<!-- resources/js/Pages/Welcome.vue -->
<script setup>
import { Head, Link } from '@inertiajs/vue3';
import Layout from '@/Layouts/Index.vue';
import BlogCard from '../../../Components/BlogCard.vue';
import './Blog.css';
// Define props received from layout

const props = defineProps({
    blogs: {
        type: Array,
        required: true
    }
});
const truncateText = (text, wordLimit = 5) => {
    const words = text.split(' ');
    return words.slice(0, wordLimit).join(' ') + (words.length > wordLimit ? '...' : '');
};

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
            <!-- <BlogCard 
                imageSrc="/blog/two.jpg" 
                title="Top 10 Google’s Most Searched Movies in the World (2022)"
                author="Ridoy Hasan" 
                :views="20" 
                date="15 August 2024" 
                :link="route('blog.details')"  
            /> -->

            <BlogCard v-for="(blog, index) in blogs" 
                :imageSrc="blog.image"
                :title="truncateText(blog.title)"
                :author="blog.user.name" 
                :views="blog.view" 
                :date="new Date(blog.created_at).toLocaleDateString('en-GB', {
                    day: '2-digit',
                    month:
                        'long', year: 'numeric'
                })" 
                :link="route('blog.details', blog.slug)" />








        </div>
    </div>

</template>
