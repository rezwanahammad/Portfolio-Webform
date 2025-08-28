<%@ Page MasterPageFile="~/MasterPage.master" AutoEventWireup="true" %>

<%@ Register Src="~/Sections/About.ascx" TagPrefix="sec" TagName="About" %>
<%@ Register Src="~/Sections/Education.ascx" TagPrefix="sec" TagName="Education" %>
<%@ Register Src="~/Sections/Skills.ascx" TagPrefix="sec" TagName="Skills" %>
<%@ Register Src="~/Sections/Projects.ascx" TagPrefix="sec" TagName="Projects" %>
<%@ Register Src="~/Sections/Photography.ascx" TagPrefix="sec" TagName="Photography" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

 <!-- Hero Section -->
        <section id="home" class="max-w-7xl mx-auto p-6 md:p-10 mt-10 text-center">
            <!-- Profile Image -->
            <div class="profile-pic-wrapper">
                <img src="Images/profile.jpg" alt="Rezwan Ahammad Raad" class="profile-pic" />
            </div>

            <!-- Hero Text -->
                <h1 class="hero-title" id="typewriter">Hi, I’m Raad</h1>

            <p class="hero-subtitle">
                Computer Science & Engineering student with expertise in C, C++, Python, Java, JavaScript, and modern frameworks like React, Next.js, and React Native. Dedicated to building impactful solutions through code. Always learning, always building.
            </p>
        </section>

        
          <!-- Social Links -->
      <div class="mt-0 flex justify-center gap-6 text-xl">
         <a href="Files/CV_Raad.pdf" download="Rezwan_Ahammad_CV" class="cv-btn">
        <img src="Images/download-icon.png" alt="Download CV" class="cv-icon" />
        CV
    </a>
          <a href="https://www.linkedin.com/in/rezwan-ahammad-a684b024b/" target="_blank" class="hover:text-gray-600">
            <i class="fab fa-linkedin"></i>
           </a>
        <a href="https://github.com/rezwanahammad" target="_blank" class="hover:text-gray-600">
          <i class="fab fa-github"></i>
        </a>
        <a href="https://www.facebook.com/rezwan.ahammad.raad.2024" target="_blank" class="hover:text-blue-600">
          <i class="fab fa-facebook"></i>
        </a>
          <a href="https://www.instagram.com/__raaaaaaaaad/" target="_blank" class="hover:text-blue-600">
        <i class="fab fa-instagram"></i>
        </a>
            <a href="https://web.whatsapp.com/" target="_blank" class="hover:text-blue-600">
            <i class="fab fa-whatsapp"></i>
            </a>
          <a href="https://www.pinterest.com/rezwanahammad/" target="_blank" class="hover:text-blue-600">
            <i class="fab fa-pinterest"></i>
           </a>
        <a href="https://x.com/Rezwanraad68" target="_blank" class="hover:text-sky-500">
          <i class="fab fa-twitter"></i>
        </a>
      </div>




    <!-- Include Modular Sections -->
    <sec:About runat="server" />
    <sec:Education runat="server" />
    <sec:Skills runat="server" />
    <sec:Projects runat="server" />
    <sec:Photography runat="server" />

</asp:Content>
