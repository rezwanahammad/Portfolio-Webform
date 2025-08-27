<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="YourNamespace.Contact" %>

<section id="contact" class="max-w-7xl mx-auto p-6 md:p-10 mt-10">
    <h2 class="section-title text-center mb-10">Get In Touch</h2>
    
    <div class="flex flex-col md:flex-row gap-8">
        <!-- Contact Form -->
        <div class="w-full md:w-2/3">
            <div class="bg-gray-900 border border-[#20B2AA] p-6 rounded-lg shadow-md">
                <form id="contactForm" runat="server">
                    <div class="mb-4">
                        <label for="txtName" class="block text-gray-300 mb-2">Name *</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                            ControlToValidate="txtName" 
                            ErrorMessage="Name is required" 
                            CssClass="text-red-500 text-sm mt-1" 
                            Display="Dynamic" />
                    </div>
                    
                    <div class="mb-4">
                        <label for="txtEmail" class="block text-gray-300 mb-2">Email *</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="your.email@example.com" TextMode="Email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Email is required" 
                            CssClass="text-red-500 text-sm mt-1" 
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Please enter a valid email" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            CssClass="text-red-500 text-sm mt-1" 
                            Display="Dynamic" />
                    </div>
                    
                    <div class="mb-4">
                        <label for="txtSubject" class="block text-gray-300 mb-2">Subject *</label>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Message Subject" />
                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                            ControlToValidate="txtSubject" 
                            ErrorMessage="Subject is required" 
                            CssClass="text-red-500 text-sm mt-1" 
                            Display="Dynamic" />
                    </div>
                    
                    <div class="mb-6">
                        <label for="txtMessage" class="block text-gray-300 mb-2">Message *</label>
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" 
                            TextMode="MultiLine" Rows="5" placeholder="Your message here..." />
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                            ControlToValidate="txtMessage" 
                            ErrorMessage="Message is required" 
                            CssClass="text-red-500 text-sm mt-1" 
                            Display="Dynamic" />
                    </div>
                    
                    <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn" OnClick="btnSend_Click" />
                    
                    <asp:Label ID="lblMessage" runat="server" CssClass="mt-4 block" />
                </form>
            </div>
        </div>
        
        <!-- Contact Information -->
        <div class="w-full md:w-1/3">
            <div class="bg-gray-900 border border-[#20B2AA] p-6 rounded-lg shadow-md contact-info-box">
                <h3 class="text-xl font-semibold mb-4 bg-gradient-to-r from-[#7FFFD4] via-[#40E0D0] to-[#20B2AA] bg-clip-text text-transparent">
                    Contact Information
                </h3>
                <ul class="text-gray-300 space-y-4">
                    <li class="flex items-start">
                        <span class="mr-3 text-[#7FFFD4]">📧</span>
                        <span>rezwanahammad68@gmail.com</span>
                    </li>
                    <li class="flex items-start">
                        <span class="mr-3 text-[#7FFFD4]">📱</span>
                        <span>+880 1714653351</span>
                    </li>
                    <li class="flex items-start">
                        <span class="mr-3 text-[#7FFFD4]">📍</span>
                        <span>Mymensingh, Bangladesh</span>
                    </li>
                    <li class="flex items-start">
                        <span class="mr-3 text-[#7FFFD4]">🌐</span>
                        <span>www.yourportfolio.com</span>
                    </li>
                </ul>
                
                <!-- Social Links -->
                <div class="mt-6">
                    <h4 class="text-gray-300 font-semibold mb-3">Follow Me</h4>
                    <div class="flex space-x-4">
                        <a href="#" class="text-[#7FFFD4] hover:text-[#20B2AA] transition-colors">
                            <span class="sr-only">GitHub</span>
                            <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                            </svg>
                        </a>
                        <a href="#" class="text-[#7FFFD4] hover:text-[#20B2AA] transition-colors">
                            <span class="sr-only">LinkedIn</span>
                            <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>