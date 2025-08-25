<%@ Page MasterPageFile="~/MasterPage.master" AutoEventWireup="true" %>

<%@ Register Src="~/Sections/About.ascx" TagPrefix="sec" TagName="About" %>
<%@ Register Src="~/Sections/Education.ascx" TagPrefix="sec" TagName="Education" %>
<%@ Register Src="~/Sections/Skills.ascx" TagPrefix="sec" TagName="Skills" %>
<%@ Register Src="~/Sections/Projects.ascx" TagPrefix="sec" TagName="Projects" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section id="home" class="max-w-7xl mx-auto p-6 md:p-10 mt-10 text-center">
        <h1 class="text-4xl md:text-6xl font-bold mb-4 bg-gradient-to-r from-[#7FFFD4] to-[#20B2AA] bg-clip-text text-transparent">
            Hi, I’m Raad
        </h1>
        <p class="text-gray-300 text-lg md:text-xl leading-relaxed">
            Computer Science & Engineering student with expertise in C, C++, Python, Java, JavaScript, and modern frameworks like React, Next.js, and React Native. Dedicated to building impactful solutions through code. Always learning, always building.
        </p>
    </section>

    <!-- Include Modular Sections -->
    <sec:About runat="server" />
    <sec:Education runat="server" />
    <sec:Skills runat="server" />
    <sec:Projects runat="server" />
    

</asp:Content>