<template>
  <div
    class="relative w-full h-full overflow-hidden flex flex-col items-center justify-center bg-gradient-to-br from-gray-100 to-gray-200"
  >
    <div
      class="md:w-full w-[95vw] h-full p-2 md:p-8 flex items-center justify-center"
    >
      <vue-office-pdf
        :src="pdfSrc"
        class="md:w-full flex-1 md:h-[130vh] h-[90vh] md:scale-75 rounded-lg shadow-x"
        @rendered="renderedHandler"
        @error="errorHandler"
      />
    </div>

    <div
      class="absolute bottom-6 left-0 right-0 flex justify-center md:top-4 md:left-4 md:right-auto md:bottom-auto md:flex-col md:items-start"
    >
      <div class="flex space-x-4 md:space-x-0 md:space-y-4 md:flex-col">
        <button
          @click="downloadCV"
          class="bg-blue-500 hover:bg-blue-600 text-white text-sm font-semibold py-1.5 px-3 rounded-md shadow-md transition duration-300 ease-in-out transform hover:scale-105 flex items-center"
        >
          <i class="fas fa-download text-xs"></i>下载简历
        </button>
        <button
          @click="copyEmail"
          class="bg-green-500 hover:bg-green-600 text-white text-sm font-semibold py-1.5 px-3 rounded-md shadow-md transition duration-300 ease-in-out transform hover:scale-105 flex items-center"
        >
          <i class="fas fa-envelope text-xs"></i>复制邮箱
        </button>
        <a
          :href="appConfig.blogUrl"
          target="_blank"
          rel="noopener noreferrer"
          class="bg-purple-500 hover:bg-purple-600 text-white text-sm font-semibold py-1.5 px-3 rounded-md shadow-md transition duration-300 ease-in-out transform hover:scale-105 flex items-center"
        >
          <i class="fas fa-blog text-xs"></i>访问博客
        </a>
      </div>
    </div>
  </div>
</template>

<script setup lang="js">
import { ref } from "vue";
import VueOfficePdf from "@vue-office/pdf";
import eventBus from "../utils/eventBus";
import { appConfig } from "../config/app.config";

const pdfSrc = ref(new URL('../assets/简历.pdf', import.meta.url).href);

const renderedHandler = () => {
  console.log("PDF渲染完成");
};

const errorHandler = (error) => {
  console.error("PDF渲染失败", error);
};

const downloadCV = () => {
  const link = document.createElement('a');
  link.href = pdfSrc.value;
  link.download = appConfig.resumeFileName;
  link.click();
  eventBus.emit("showToast", { message: "开始下载...", type: "info" });
};

const copyEmail = () => {
  const textArea = document.createElement("textarea");
  textArea.value = appConfig.email;
  document.body.appendChild(textArea);
  textArea.select();

  try {
    document.execCommand('copy');
    eventBus.emit("showToast", { message: "邮箱已复制！", type: "success" });
  } catch (error) {
    console.error("复制邮箱失败:", error);
    eventBus.emit("showToast", {
      message: "复制邮箱失败，请手动复制。",
      type: "error",
    });
  } finally {
    document.body.removeChild(textArea);
  }
};
</script>
