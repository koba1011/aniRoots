window.addEventListener("load", () => {
  const uploader = document.querySelector(".uploader");
  uploader.addEventListener("change", (e) => {
    const file = uploader.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      const image = reader.result;
      document.getElementById("image-back").setAttribute("src", image);
    };
  });
});
