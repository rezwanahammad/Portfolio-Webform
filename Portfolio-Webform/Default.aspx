<%@ Page MasterPageFile="~/MasterPage.master" AutoEventWireup="true" %>

<%@ Register Src="~/Sections/About.ascx" TagPrefix="sec" TagName="About" %>
<%@ Register Src="~/Sections/Education.ascx" TagPrefix="sec" TagName="Education" %>
<%@ Register Src="~/Sections/Skills.ascx" TagPrefix="sec" TagName="Skills" %>
<%@ Register Src="~/Sections/Projects.ascx" TagPrefix="sec" TagName="Projects" %>
<%@ Register Src="~/Sections/Photography.ascx" TagPrefix="sec" TagName="Photography" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section id="home" class="max-w-7xl mx-auto p-6 md:p-10 mt-10 text-center">
        <!-- Profile Image (optional, uncomment when needed) -->
        <div class="relative mb-8 inline-block">
            <div class="w-24 h-24 md:w-24 md:h-24 rounded-full border-4 border-[#7FFFD4] mx-auto overflow-hidden shadow-lg relative">
                <img src="Images/profile.jpg" alt="Rezwan Ahammad Raad" class="w-full h-full object-contain" />
            </div>
        </div>
        

        <!-- Hero Text -->
        <h1 class="hero-title">
            Hi, I’m Raad
        </h1>
        <p class="hero-subtitle">
            Computer Science & Engineering student with expertise in C, C++, Python, Java, JavaScript, and modern frameworks like React, Next.js, and React Native. Dedicated to building impactful solutions through code. Always learning, always building.
        </p>
    </section>

    <!-- Include Modular Sections -->
    <sec:About runat="server" />
    <sec:Education runat="server" />
    <sec:Skills runat="server" />
    <sec:Projects runat="server" />
    <sec:Photography runat="server" />

</asp:Content>
