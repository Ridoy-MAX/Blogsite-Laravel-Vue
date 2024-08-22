<!-- resources/js/Pages/Welcome.vue -->
<script setup>
import { Head, Link } from '@inertiajs/vue3';

import './About.css';
const props = defineProps({
    about: {
    type: Object,
    required: true
  }
});
</script>

<template>


    <Head title="Welcome" />
    <div class="container  mt-3" id="about">
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="home_section_about">
                    <h2>About </h2>

                    <h1>{{props.about.title}} </h1>




                </div>
            </div>



        </div>


    </div>



</template>
