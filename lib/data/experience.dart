import 'package:flutter_riverpod/flutter_riverpod.dart';

final experiencesProvider = Provider<List<Experience>>((ref) {
  return [
    Experience(
      title: 'Mobile Team Lead - PM',
      company: 'Sisal - Flutter Entertainment PLC, Naples, Italy',
      startDate: 'October 2022',
      endDate: 'Present',
      shortDescription: 'Mobile Tech Lead on Betting Android',
      fullDescription:
      'Over the past year, I led the transformation of our mobile app into a modular component, enabling integration across major platforms such as Sisal, PokerStars, and SNAI, serving over 500K weekly active users. I managed the full project lifecycle—overseeing team activities, coordinating with Product Owners, UX/UI, QA, the Test Factory, and business stakeholders to ensure alignment and timely delivery.\n\nActing as the main interface between tech and business, I conducted functional analysis of complex tasks, identified blockers early, and optimized workflows. This resulted in a 30% increase in team productivity and a significant reduction in stress. I streamlined CI/CD pipelines to support monthly releases for both the test factory and production across all brands.\n\nBy fostering cross-team collaboration and refining internal processes, I reduced unnecessary communication overhead by 30% and improved delivery speed. My tech expertise includes Android (Kotlin, MVVM, Jetpack Compose), Flutter (Dart), Firebase, Jira, ServiceNow, and integration with external SDKs and modules.',
      tags: ['Mobile Lead', 'Management'],
    ),
    Experience(
      title: 'Mobile Developer - Team Lead',
      company: 'NTT Data Italia, Naples, Italy',
      startDate: 'May 2019',
      endDate: 'September 2022',
      shortDescription: 'Consultant as Mobile Team Lead',
      fullDescription:
      'Spearheaded mobile development initiatives at NTT Data as Team Lead, managing multiple Android Native and Flutter projects across high-profile clients including Enel (both internal employee app and public electric charging app), Tolemaica (legal certification startup), Kena Mobile, TIM, Poste Italiane, and others. I acted as a key point of contact with clients, translating business needs into technical solutions, and ensuring timely, high-quality delivery across diverse project scopes.\n\nIn addition to coordinating team efforts and aligning cross-functional stakeholders, I contributed hands-on with Kotlin and Java development, JSON parsing, and robust networking using Retrofit and Volley. I also integrated Firebase services for analytics, crash reporting, and real-time performance monitoring, enhancing the stability and insight across all applications.',
      tags: ['Mobile', 'Development'],
    ),
    Experience(
      title: 'Mobile Developer',
      company: 'Beta 80 Group, Milan, Italy',
      startDate: 'November 2017',
      endDate: 'April 2022',
      shortDescription: 'Mobile developer',
      fullDescription:
      'I worked as a mobile Android developer, first on a project at the Catholic University of Milan and later for Leroy Merlin Italy. In these roles, I focused on native Android development using Java, following the MVC architectural pattern, and integrating with backend services based on Node.js microservices.',
      tags: ['Mobile', 'Development'],
    ),
    Experience(
      title: 'Web & Mobile Developer',
      company: 'Modis - WebRatio, Milan, Italy',
      startDate: 'May 2017',
      endDate: 'April 2017',
      shortDescription: 'Web and Mobile developer',
      fullDescription:
      'Expert in web application development leveraging Webratio Tools, Java, JavaScript, and Groovy for robust, scalable solutions.\n\nProficient in SQL database management to ensure efficient data storage and retrieval.\n\nSkilled in crafting cross-platform mobile applications utilizing JavaScript and PhoneGap frameworks.',
      tags: ['Mobile', 'Web'],
    ),
    Experience(
      title: 'Web & Mobile Developer',
      company: 'Freelance, Naples, Italy',
      startDate: 'November 2015',
      endDate: 'April 2017',
      shortDescription: 'Web developer',
      fullDescription:
      'Proficient in web and mobile development, with experience in graphic design utilizing Adobe Creative Suite.\n\nExpertise in front-end technologies including HTML, CSS, and JavaScript, coupled with WordPress and MySQL for website creation.\n\nSkilled in Java for Android app development, delivering seamless mobile user experiences.',
      tags: ['Web', 'Wordpress'],
    ),
    Experience(
      title: 'Mobile Developer',
      company: 'iReplace, Benevento, Italy',
      startDate: 'January 2015',
      endDate: 'December 2015',
      shortDescription: 'Android Mobile Developer',
      fullDescription:
      'Proficient Android App Developer with experience in crafting robust applications using Java and XML for native layouts, coupled with adept JSON parsing for efficient database communication via RESTful APIs.\n\nLeveraged Google Play Services to enhance app functionality, particularly in integrating advanced mapping features.',
      tags: ['Mobile', 'Android'],
    ),
    Experience(
      title: 'Mobile Developer',
      company: 'HQuadro, Avellino, Italy',
      startDate: 'January 2014',
      endDate: 'September 2013',
      shortDescription: 'Mobile Developer',
      fullDescription:
      'Spearheaded mobile application development within a team, leveraging cutting-edge tools such as JavaScript, CSS, and HTML5.\n\nProficient in PhoneGap and Sencha Touch frameworks for seamless cross-platform app creation.\n\nSkilled in native Android development using Eclipse, with a strong focus on RESTful APIs, JSON/XML parsing, and SQL database queries.',
      tags: ['Mobile', 'Hybrid'],
    ),
    Experience(
      title: 'Web Developer',
      company: 'Blighty Group, London, UK',
      startDate: 'January 2013',
      endDate: 'June 2013',
      shortDescription: 'Android Mobile Developer',
      fullDescription:
      'Work Experience in IT, in particular i used PHP to solve some bugs on beck-end.\n\nOthers skills are about graphics and web design, business managment with KPI managment.',
      tags: ['Web', 'PHP'],
    ),
    Experience(
      title: 'SCADA Developer',
      company: 'Princes Alimentari, Foggia, Italy',
      startDate: 'June 2012',
      endDate: 'December 2012',
      shortDescription: 'SCADA Developer',
      fullDescription:
      'Worked in technical area of food factory.\n\nI used PHP and SQL for Windows Server and MySql, SCADA systems.\n\nI worked on the KPI and others business solutions.',
      tags: ['SCADA', 'PLC'],
    ),
  ];
});

class Experience {
  final String title;
  final String company;
  final String startDate;
  final String endDate;
  final String? shortDescription;
  final String fullDescription;
  final List<String> tags;

  Experience({
    required this.title,
    required this.company,
    required this.startDate,
    required this.endDate,
    this.shortDescription,
    required this.fullDescription,
    required this.tags,
  });
}