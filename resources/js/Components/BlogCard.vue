<script setup>
import { Link } from '@inertiajs/vue3';

defineProps({
    imageSrc: String,
    title: String,
    author: String,
    views: Number,
    date: String,
    link: String, // Add link prop
});
</script>
<template>
    <div class="col-md-4">
        <div class="blog_card">
            <div class="image w-100">
                <img :src="imageSrc" alt="">
            </div>
            <div class="title">
                <!-- Wrap title with Link component -->
                <Link :href="link">
                <h1>{{ title }}</h1>
                </Link>
            </div>
            <div class="count d-flex justify-content-between">
                <span><i class="fa-regular fa-user me-1"></i>{{ author }}</span>
                <span><i class="fa-regular fa-eye me-1"></i>{{ views }}</span>
                <span><i class="fa-regular fa-calendar-days"></i>{{ date }}</span>
            </div>
        </div>
    </div>
</template>



<style scoped>
.home_section_blog {
    margin-top: 200px;
}

.home_section_blog h2 {
    background: -webkit-gradient(linear, left top, right top, from(#7338e7), to(#f9bf01));
    background: -o-linear-gradient(left, #7338e7 0%, #f9bf01 100%);
    background: linear-gradient(90deg, #7338e7, #f9bf01);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    display: inline-block;
    font-weight: 700;
    font-family: var(--family1);
    font-size: 60px;
    line-height: 1.15em;
    text-align: center;
    margin: auto;
    display: flex;
    justify-content: center;

}

.home_section_blog h1 {
    margin-top: 30px;
    font-size: 20px;
    text-align: center;
    color: white;
}

.blog_card {
    margin-bottom: 30px;
}
.blog_card a{
    text-decoration: none;
    color: white;
}
.blog_card a:hover{
    cursor: pointer;
    color: #5506af;
}
.blog_card .image img {
    border-radius: 15px;
    height: 200px;
    width: 100%;
    background-size: cover;
    

}

.blog_card .title h1 {
    margin-top: 10px;
    margin-bottom: 10px;
    font-size: 20px;
}
</style>