-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2026 at 10:41 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ttbdo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `trace_no` varchar(40) NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `office_id` int(10) UNSIGNED NOT NULL,
  `activity_kind` enum('RESEARCH','EXTENSION') NOT NULL,
  `activity_type_id` smallint(5) UNSIGNED NOT NULL,
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(300) NOT NULL,
  `objective_type_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `objective` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `details_url` varchar(500) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_beneficiary`
--

CREATE TABLE `activity_beneficiary` (
  `activity_beneficiary_id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `class_id` tinyint(3) UNSIGNED NOT NULL,
  `target_group_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `unit_type` enum('Individual','Household','Community','Organization/Institution') DEFAULT NULL,
  `beneficiary_name` varchar(200) DEFAULT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT NULL,
  `male_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `female_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `other_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_budget`
--

CREATE TABLE `activity_budget` (
  `budget_id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `budget_kind` enum('Indicative','Actual') NOT NULL,
  `fund_source_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_flagship`
--

CREATE TABLE `activity_flagship` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `flagship_no` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_internal_unit`
--

CREATE TABLE `activity_internal_unit` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_location`
--

CREATE TABLE `activity_location` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_partner`
--

CREATE TABLE `activity_partner` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `partner_role` varchar(60) NOT NULL DEFAULT 'External coordinating unit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_personnel`
--

CREATE TABLE `activity_personnel` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `personnel_id` int(10) UNSIGNED NOT NULL,
  `project_role_id` tinyint(3) UNSIGNED NOT NULL,
  `specifics` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_sdg`
--

CREATE TABLE `activity_sdg` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `sdg_no` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_status`
--

CREATE TABLE `activity_status` (
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `status_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_status`
--

INSERT INTO `activity_status` (`status_id`, `status_name`) VALUES
(2, 'Approved'),
(6, 'Cancelled'),
(4, 'Completed'),
(3, 'Ongoing'),
(1, 'Proposed'),
(5, 'Terminated');

-- --------------------------------------------------------

--
-- Table structure for table `activity_type`
--

CREATE TABLE `activity_type` (
  `activity_type_id` smallint(5) UNSIGNED NOT NULL,
  `activity_kind` enum('RESEARCH','EXTENSION') NOT NULL,
  `type_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_type`
--

INSERT INTO `activity_type` (`activity_type_id`, `activity_kind`, `type_name`) VALUES
(7, 'RESEARCH', 'Applied Research'),
(6, 'RESEARCH', 'Basic Research'),
(8, 'RESEARCH', 'Development'),
(2, 'EXTENSION', 'Direct Service Provision'),
(4, 'EXTENSION', 'Information Dissemination'),
(3, 'EXTENSION', 'Service Learning'),
(5, 'EXTENSION', 'Service to the University'),
(1, 'EXTENSION', 'Technical Advice');

-- --------------------------------------------------------

--
-- Table structure for table `agreement_type`
--

CREATE TABLE `agreement_type` (
  `agreement_type_id` tinyint(3) UNSIGNED NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agreement_type`
--

INSERT INTO `agreement_type` (`agreement_type_id`, `type_name`) VALUES
(3, 'Assignment'),
(5, 'Incubation'),
(1, 'License'),
(2, 'MOA'),
(4, 'Technology Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `app_role`
--

CREATE TABLE `app_role` (
  `role_id` tinyint(3) UNSIGNED NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_role`
--

INSERT INTO `app_role` (`role_id`, `role_name`) VALUES
(1, 'ADMIN'),
(3, 'EXECUTIVE'),
(2, 'OFFICE_STAFF');

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` tinyint(3) UNSIGNED NOT NULL,
  `office_id` int(10) UNSIGNED DEFAULT NULL,
  `personnel_id` int(10) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `audit_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `table_name` varchar(64) NOT NULL,
  `record_id` varchar(64) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_class`
--

CREATE TABLE `beneficiary_class` (
  `class_id` tinyint(3) UNSIGNED NOT NULL,
  `side` enum('Internal','External') NOT NULL,
  `class_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `beneficiary_class`
--

INSERT INTO `beneficiary_class` (`class_id`, `side`, `class_name`) VALUES
(4, 'Internal', 'Administrative Personnel'),
(2, 'Internal', 'Faculty Members'),
(3, 'Internal', 'REPS'),
(1, 'Internal', 'Students'),
(5, 'External', 'Academic Institutions'),
(9, 'External', 'For Profit Organizations'),
(10, 'External', 'General Public'),
(7, 'External', 'Government Agencies'),
(8, 'External', 'Non-Profit Organization'),
(6, 'External', 'Professional Associations');

-- --------------------------------------------------------

--
-- Table structure for table `commercialization_agreement`
--

CREATE TABLE `commercialization_agreement` (
  `agreement_id` int(10) UNSIGNED NOT NULL,
  `agreement_no` varchar(50) NOT NULL,
  `ip_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `agreement_type_id` tinyint(3) UNSIGNED NOT NULL,
  `signed_date` date DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_exclusive` tinyint(1) NOT NULL DEFAULT 0,
  `upfront_fee` decimal(15,2) NOT NULL DEFAULT 0.00,
  `royalty_rate_pct` decimal(5,2) DEFAULT NULL,
  `agreement_status` enum('Draft','Active','Expired','Terminated') NOT NULL DEFAULT 'Draft'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `commercialization_revenue`
--

CREATE TABLE `commercialization_revenue` (
  `revenue_id` int(10) UNSIGNED NOT NULL,
  `agreement_id` int(10) UNSIGNED NOT NULL,
  `received_date` date NOT NULL,
  `revenue_type` enum('Upfront Fee','Royalty','Milestone','Other') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(10) UNSIGNED NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `college_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `document_id` int(10) UNSIGNED NOT NULL,
  `doc_type_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `version_no` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `activity_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_id` int(10) UNSIGNED DEFAULT NULL,
  `agreement_id` int(10) UNSIGNED DEFAULT NULL,
  `uploaded_by` int(10) UNSIGNED DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `doc_type_id` smallint(5) UNSIGNED NOT NULL,
  `doc_type_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`doc_type_id`, `doc_type_name`) VALUES
(4, 'Attendance Sheet'),
(5, 'Evidence'),
(7, 'Financial Report'),
(6, 'IP Filing Document'),
(3, 'MOA / Contract'),
(8, 'Other'),
(1, 'Proposal'),
(2, 'Terminal Report');

-- --------------------------------------------------------

--
-- Table structure for table `extension_activity`
--

CREATE TABLE `extension_activity` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `activity_kind` enum('RESEARCH','EXTENSION') NOT NULL DEFAULT 'EXTENSION',
  `duration_hours` decimal(6,2) DEFAULT NULL,
  `venue` varchar(200) DEFAULT NULL,
  `scope` enum('Instruction','Research','Extension','Administration') DEFAULT NULL,
  `level_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `frequency` enum('Weekly','Monthly','Quarterly','Annually','Others') DEFAULT NULL,
  `target_domain` enum('Instruction','Research','Extension','Administration') DEFAULT NULL,
  `subject_area_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `implementing_dept_id` int(10) UNSIGNED DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `flagship_program`
--

CREATE TABLE `flagship_program` (
  `flagship_no` tinyint(3) UNSIGNED NOT NULL,
  `flagship_name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flagship_program`
--

INSERT INTO `flagship_program` (`flagship_no`, `flagship_name`) VALUES
(1, 'Academic Excellence'),
(6, 'Active and Collaborative Partnerships'),
(5, 'Archipelagic and Oceanic Virtual University (AOVU)'),
(7, 'Arts and Culture'),
(10, 'Digital Transformation'),
(8, 'Expansion of Public Service Offices'),
(2, 'Inclusive Admissions'),
(4, 'Open and Distance e-Learning (ODeL)'),
(9, 'Quality Management System (QMS) and Quality Assurance (QA)'),
(3, 'Research and Innovation');

-- --------------------------------------------------------

--
-- Table structure for table `fund_source`
--

CREATE TABLE `fund_source` (
  `fund_source_id` int(10) UNSIGNED NOT NULL,
  `fund_code` varchar(10) NOT NULL,
  `source_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fund_source`
--

INSERT INTO `fund_source` (`fund_source_id`, `fund_code`, `source_name`) VALUES
(1, '101', 'General Fund'),
(2, '102', 'Foreign Assisted Projects'),
(3, '16$', 'Revolving Fund-Dollar'),
(4, '164', 'Revolving Fund'),
(5, '165', 'Reprogrammed Fund'),
(6, '18$', 'Trust Fund Dollar'),
(7, '184', 'Trust Fund'),
(8, 'B01', 'APP Regular Agency Fund'),
(9, 'UNSPEC', 'Unspecified');

-- --------------------------------------------------------

--
-- Table structure for table `institutionalization_level`
--

CREATE TABLE `institutionalization_level` (
  `level_id` tinyint(3) UNSIGNED NOT NULL,
  `level_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institutionalization_level`
--

INSERT INTO `institutionalization_level` (`level_id`, `level_name`) VALUES
(1, 'Institutional'),
(4, 'International'),
(2, 'Local/Regional'),
(3, 'National');

-- --------------------------------------------------------

--
-- Table structure for table `intellectual_property`
--

CREATE TABLE `intellectual_property` (
  `ip_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(40) NOT NULL,
  `ip_reg_no` varchar(60) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `ip_type_id` tinyint(3) UNSIGNED NOT NULL,
  `current_status_id` tinyint(3) UNSIGNED NOT NULL,
  `source_project_id` int(10) UNSIGNED DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `filing_fund_source_id` int(10) UNSIGNED DEFAULT NULL,
  `value_proposition` text DEFAULT NULL,
  `date_filed` date DEFAULT NULL,
  `date_registered` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `details_url` varchar(500) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `ip_creator`
--

CREATE TABLE `ip_creator` (
  `ip_id` int(10) UNSIGNED NOT NULL,
  `personnel_id` int(10) UNSIGNED NOT NULL,
  `creator_role` enum('Inventor','Author','Creator','Co-creator') NOT NULL DEFAULT 'Inventor',
  `contribution_pct` decimal(5,2) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `ip_status`
--

CREATE TABLE `ip_status` (
  `ip_status_id` tinyint(3) UNSIGNED NOT NULL,
  `ip_status_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ip_status`
--

INSERT INTO `ip_status` (`ip_status_id`, `ip_status_name`) VALUES
(6, 'Abandoned'),
(1, 'Disclosed'),
(2, 'Filed'),
(5, 'Lapsed'),
(4, 'Licensed'),
(3, 'Registered / Granted');

-- --------------------------------------------------------

--
-- Table structure for table `ip_status_history`
--

CREATE TABLE `ip_status_history` (
  `history_id` int(10) UNSIGNED NOT NULL,
  `ip_id` int(10) UNSIGNED NOT NULL,
  `ip_status_id` tinyint(3) UNSIGNED NOT NULL,
  `status_date` date NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `recorded_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_type`
--

CREATE TABLE `ip_type` (
  `ip_type_id` tinyint(3) UNSIGNED NOT NULL,
  `ip_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ip_type`
--

INSERT INTO `ip_type` (`ip_type_id`, `ip_type_name`) VALUES
(4, 'Copyright'),
(3, 'Industrial Design'),
(1, 'Patent'),
(6, 'Trade Secret'),
(5, 'Trademark'),
(2, 'Utility Model');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `region` varchar(80) NOT NULL,
  `province` varchar(80) NOT NULL,
  `municipality` varchar(80) NOT NULL,
  `barangay` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `objective_type`
--

CREATE TABLE `objective_type` (
  `objective_type_id` tinyint(3) UNSIGNED NOT NULL,
  `objective_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `objective_type`
--

INSERT INTO `objective_type` (`objective_type_id`, `objective_name`) VALUES
(6, 'Others'),
(1, 'To create/make/come up'),
(3, 'To decrease/reduce'),
(2, 'To increase'),
(5, 'To provide (routine services)'),
(4, 'To serve in a position');

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` int(10) UNSIGNED NOT NULL,
  `office_name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`office_id`, `office_name`) VALUES
(2, 'Office of Extension and Community Service'),
(1, 'Office of Research'),
(3, 'Technology Transfer and Business Development Office');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `organization_id` int(10) UNSIGNED NOT NULL,
  `organization_name` varchar(200) NOT NULL,
  `org_type` enum('LGU','NGO','Government Agency','Private Company','Academic Institution','Community Group','Other') NOT NULL,
  `contact_person` varchar(120) DEFAULT NULL,
  `contact_email` varchar(150) DEFAULT NULL,
  `contact_phone` varchar(40) DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `personnel_id` int(10) UNSIGNED NOT NULL,
  `given_name` varchar(80) NOT NULL,
  `middle_name` varchar(80) DEFAULT NULL,
  `surname` varchar(80) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `position_title` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `home_office_id` int(10) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `program_id` int(10) UNSIGNED NOT NULL,
  `program_name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(10) UNSIGNED NOT NULL,
  `proj_ref_no` varchar(40) DEFAULT NULL,
  `project_name` varchar(300) NOT NULL,
  `program_id` int(10) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_role`
--

CREATE TABLE `project_role` (
  `project_role_id` tinyint(3) UNSIGNED NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_role`
--

INSERT INTO `project_role` (`project_role_id`, `role_name`) VALUES
(6, 'Adviser'),
(2, 'Co-Leader'),
(5, 'Coordinator'),
(3, 'Member'),
(1, 'Project Leader'),
(4, 'Resource Person');

-- --------------------------------------------------------

--
-- Table structure for table `research_project`
--

CREATE TABLE `research_project` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `activity_kind` enum('RESEARCH','EXTENSION') NOT NULL DEFAULT 'RESEARCH',
  `research_area` varchar(150) DEFAULT NULL,
  `ethics_clearance_no` varchar(60) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `sdg`
--

CREATE TABLE `sdg` (
  `sdg_no` tinyint(3) UNSIGNED NOT NULL,
  `sdg_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sdg`
--

INSERT INTO `sdg` (`sdg_no`, `sdg_name`) VALUES
(7, 'Affordable and Clean Energy'),
(6, 'Clean Water and Sanitation'),
(13, 'Climate Action'),
(8, 'Decent Work and Economic Growth'),
(5, 'Gender Equality'),
(3, 'Good Health and Well-being'),
(9, 'Industry, Innovation and Infrastructure'),
(14, 'Life Below Water'),
(15, 'Life on Land'),
(1, 'No Poverty'),
(17, 'Partnerships for the Goals'),
(16, 'Peace, Justice and Strong Institutions'),
(4, 'Quality Education'),
(10, 'Reduced Inequalities'),
(12, 'Responsible Consumption and Production'),
(11, 'Sustainable Cities and Communities'),
(2, 'Zero Hunger');

-- --------------------------------------------------------

--
-- Table structure for table `subject_area`
--

CREATE TABLE `subject_area` (
  `subject_area_id` tinyint(3) UNSIGNED NOT NULL,
  `area_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject_area`
--

INSERT INTO `subject_area` (`subject_area_id`, `area_name`) VALUES
(1, 'Agri-forestry'),
(2, 'Arts and Humanities'),
(3, 'Business Management and Economics'),
(9, 'Education'),
(4, 'Engineering and Technology'),
(5, 'Fisheries and Ocean Sciences'),
(10, 'Human Kinetics'),
(6, 'Medicine and Health Sciences'),
(7, 'Natural Sciences'),
(8, 'Social Sciences and Law'),
(11, 'Social Work and Community Development');

-- --------------------------------------------------------

--
-- Table structure for table `target_group`
--

CREATE TABLE `target_group` (
  `target_group_id` tinyint(3) UNSIGNED NOT NULL,
  `group_name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `target_group`
--

INSERT INTO `target_group` (`target_group_id`, `group_name`) VALUES
(4, 'Basic Education Students/Teachers (DepEd or private K-12)'),
(14, 'Children and Youth'),
(21, 'Faith-Based Organizations'),
(10, 'Farmers, Fisherfolk, & Agricultural Workers'),
(5, 'Higher Education Institutions (HEIs) (Non-UP faculty/students)'),
(18, 'Incarcerated Persons/Persons Deprived of Liberty (PDL)'),
(11, 'Indigenous Peoples (IP) / Cultural Communities'),
(6, 'Local Government Unit (LGU) Officials & Staff'),
(17, 'Micro-Entrepreneurs and MSMEs'),
(7, 'National Government Agency'),
(19, 'Non-Government Organizations (NGOs) & Foundations'),
(15, 'Older Adults/Senior Citizens'),
(20, 'People\'s Organizations (POs) & Community Associations'),
(16, 'Persons with Disabilities'),
(9, 'Policy Makers & Legislators'),
(22, 'Private Corporations and Industry Partner'),
(8, 'Public Health Workers (Barangay Health Workers, Doctors, Nurses)'),
(3, 'UP Administrative Staff'),
(2, 'UP Faculty & REPS (Research, Extension, and Professional Staff)'),
(1, 'UP students (Undergraduate/Graduate)'),
(12, 'Urban Poor/Informal Settlers'),
(13, 'Women and Maternal Groups');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_activity_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_activity_summary` (
`activity_id` int(10) unsigned
,`trace_no` varchar(40)
,`activity_kind` enum('RESEARCH','EXTENSION')
,`type_name` varchar(80)
,`status_name` varchar(30)
,`proj_ref_no` varchar(40)
,`project_name` varchar(300)
,`program_name` varchar(200)
,`title` varchar(300)
,`start_date` date
,`end_date` date
,`indicative_total` decimal(37,2)
,`actual_total` decimal(37,2)
,`total_beneficiaries` decimal(34,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_beneficiary_impact`
-- (See below for the actual view)
--
CREATE TABLE `v_beneficiary_impact` (
`side` enum('Internal','External')
,`class_name` varchar(80)
,`target_group` varchar(120)
,`male` decimal(32,0)
,`female` decimal(32,0)
,`other` decimal(32,0)
,`total` decimal(34,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_budget_by_office_fund`
-- (See below for the actual view)
--
CREATE TABLE `v_budget_by_office_fund` (
`fund_code` varchar(10)
,`source_name` varchar(150)
,`indicative_total` decimal(37,2)
,`actual_total` decimal(37,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ip_portfolio`
-- (See below for the actual view)
--
CREATE TABLE `v_ip_portfolio` (
`ip_id` int(10) unsigned
,`reference_no` varchar(40)
,`ip_reg_no` varchar(60)
,`title` varchar(300)
,`ip_type_name` varchar(50)
,`ip_status_name` varchar(40)
,`date_filed` date
,`date_registered` date
,`expiry_date` date
,`agreements` bigint(21)
,`revenue_to_date` decimal(37,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_project_overview`
-- (See below for the actual view)
--
CREATE TABLE `v_project_overview` (
`project_id` int(10) unsigned
,`proj_ref_no` varchar(40)
,`project_name` varchar(300)
,`program_name` varchar(200)
,`offices` mediumtext
,`activity_count` bigint(21)
,`indicative_total` decimal(37,2)
,`actual_total` decimal(37,2)
,`ip_count` bigint(21)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD UNIQUE KEY `uq_trace_per_office` (`office_id`,`trace_no`),
  ADD UNIQUE KEY `uq_activity_kind` (`activity_id`,`activity_kind`),
  ADD KEY `ix_activity_project` (`project_id`),
  ADD KEY `ix_activity_status` (`status_id`),
  ADD KEY `ix_activity_dates` (`start_date`,`end_date`),
  ADD KEY `fk_act_type` (`activity_type_id`,`activity_kind`),
  ADD KEY `fk_act_objtype` (`objective_type_id`),
  ADD KEY `fk_act_creator` (`created_by`);

--
-- Indexes for table `activity_beneficiary`
--
ALTER TABLE `activity_beneficiary`
  ADD PRIMARY KEY (`activity_beneficiary_id`),
  ADD KEY `ix_ab_activity` (`activity_id`),
  ADD KEY `fk_ab_class` (`class_id`),
  ADD KEY `fk_ab_target` (`target_group_id`),
  ADD KEY `fk_ab_org` (`organization_id`);

--
-- Indexes for table `activity_budget`
--
ALTER TABLE `activity_budget`
  ADD PRIMARY KEY (`budget_id`),
  ADD UNIQUE KEY `uq_budget_line` (`activity_id`,`budget_kind`,`fund_source_id`),
  ADD KEY `fk_bud_fund` (`fund_source_id`);

--
-- Indexes for table `activity_flagship`
--
ALTER TABLE `activity_flagship`
  ADD PRIMARY KEY (`activity_id`,`flagship_no`),
  ADD KEY `fk_af_flagship` (`flagship_no`);

--
-- Indexes for table `activity_internal_unit`
--
ALTER TABLE `activity_internal_unit`
  ADD PRIMARY KEY (`activity_id`,`department_id`),
  ADD KEY `fk_aiu_dept` (`department_id`);

--
-- Indexes for table `activity_location`
--
ALTER TABLE `activity_location`
  ADD PRIMARY KEY (`activity_id`,`location_id`),
  ADD KEY `fk_al_location` (`location_id`);

--
-- Indexes for table `activity_partner`
--
ALTER TABLE `activity_partner`
  ADD PRIMARY KEY (`activity_id`,`organization_id`),
  ADD KEY `fk_apt_org` (`organization_id`);

--
-- Indexes for table `activity_personnel`
--
ALTER TABLE `activity_personnel`
  ADD PRIMARY KEY (`activity_id`,`personnel_id`,`project_role_id`),
  ADD KEY `ix_ap_personnel` (`personnel_id`),
  ADD KEY `fk_ap_role` (`project_role_id`);

--
-- Indexes for table `activity_sdg`
--
ALTER TABLE `activity_sdg`
  ADD PRIMARY KEY (`activity_id`,`sdg_no`),
  ADD KEY `fk_as_sdg` (`sdg_no`);

--
-- Indexes for table `activity_status`
--
ALTER TABLE `activity_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `uq_status_name` (`status_name`);

--
-- Indexes for table `activity_type`
--
ALTER TABLE `activity_type`
  ADD PRIMARY KEY (`activity_type_id`),
  ADD UNIQUE KEY `uq_type_name` (`activity_kind`,`type_name`),
  ADD UNIQUE KEY `uq_type_kind` (`activity_type_id`,`activity_kind`);

--
-- Indexes for table `agreement_type`
--
ALTER TABLE `agreement_type`
  ADD PRIMARY KEY (`agreement_type_id`),
  ADD UNIQUE KEY `uq_agreement_type` (`type_name`);

--
-- Indexes for table `app_role`
--
ALTER TABLE `app_role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `uq_role_name` (`role_name`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_username` (`username`),
  ADD UNIQUE KEY `uq_user_personnel` (`personnel_id`),
  ADD KEY `fk_user_role` (`role_id`),
  ADD KEY `fk_user_office` (`office_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `ix_audit_record` (`table_name`,`record_id`),
  ADD KEY `ix_audit_time` (`changed_at`),
  ADD KEY `fk_audit_user` (`user_id`);

--
-- Indexes for table `beneficiary_class`
--
ALTER TABLE `beneficiary_class`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `uq_benef_class` (`side`,`class_name`);

--
-- Indexes for table `commercialization_agreement`
--
ALTER TABLE `commercialization_agreement`
  ADD PRIMARY KEY (`agreement_id`),
  ADD UNIQUE KEY `uq_agreement_no` (`agreement_no`),
  ADD KEY `ix_ca_ip` (`ip_id`),
  ADD KEY `ix_ca_org` (`organization_id`),
  ADD KEY `fk_ca_type` (`agreement_type_id`);

--
-- Indexes for table `commercialization_revenue`
--
ALTER TABLE `commercialization_revenue`
  ADD PRIMARY KEY (`revenue_id`),
  ADD KEY `ix_cr_agreement` (`agreement_id`,`received_date`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `uq_department` (`department_name`,`college_name`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `ix_doc_project` (`project_id`),
  ADD KEY `ix_doc_activity` (`activity_id`),
  ADD KEY `ix_doc_ip` (`ip_id`),
  ADD KEY `ix_doc_agreement` (`agreement_id`),
  ADD KEY `fk_doc_type` (`doc_type_id`),
  ADD KEY `fk_doc_user` (`uploaded_by`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`doc_type_id`),
  ADD UNIQUE KEY `uq_doc_type` (`doc_type_name`);

--
-- Indexes for table `extension_activity`
--
ALTER TABLE `extension_activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `fk_ea_activity` (`activity_id`,`activity_kind`),
  ADD KEY `fk_ea_level` (`level_id`),
  ADD KEY `fk_ea_subject` (`subject_area_id`),
  ADD KEY `fk_ea_dept` (`implementing_dept_id`);

--
-- Indexes for table `flagship_program`
--
ALTER TABLE `flagship_program`
  ADD PRIMARY KEY (`flagship_no`),
  ADD UNIQUE KEY `uq_flagship_name` (`flagship_name`);

--
-- Indexes for table `fund_source`
--
ALTER TABLE `fund_source`
  ADD PRIMARY KEY (`fund_source_id`),
  ADD UNIQUE KEY `uq_fund_code` (`fund_code`),
  ADD UNIQUE KEY `uq_fund_name` (`source_name`);

--
-- Indexes for table `institutionalization_level`
--
ALTER TABLE `institutionalization_level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `uq_level_name` (`level_name`);

--
-- Indexes for table `intellectual_property`
--
ALTER TABLE `intellectual_property`
  ADD PRIMARY KEY (`ip_id`),
  ADD UNIQUE KEY `uq_ip_reference` (`reference_no`),
  ADD UNIQUE KEY `uq_ip_regno` (`ip_reg_no`),
  ADD KEY `ix_ip_status` (`current_status_id`),
  ADD KEY `ix_ip_project` (`source_project_id`),
  ADD KEY `fk_ip_type` (`ip_type_id`),
  ADD KEY `fk_ip_dept` (`department_id`),
  ADD KEY `fk_ip_fund` (`filing_fund_source_id`);

--
-- Indexes for table `ip_creator`
--
ALTER TABLE `ip_creator`
  ADD PRIMARY KEY (`ip_id`,`personnel_id`),
  ADD KEY `fk_ic_personnel` (`personnel_id`);

--
-- Indexes for table `ip_status`
--
ALTER TABLE `ip_status`
  ADD PRIMARY KEY (`ip_status_id`),
  ADD UNIQUE KEY `uq_ip_status` (`ip_status_name`);

--
-- Indexes for table `ip_status_history`
--
ALTER TABLE `ip_status_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `ix_ish_ip` (`ip_id`,`status_date`),
  ADD KEY `fk_ish_status` (`ip_status_id`),
  ADD KEY `fk_ish_user` (`recorded_by`);

--
-- Indexes for table `ip_type`
--
ALTER TABLE `ip_type`
  ADD PRIMARY KEY (`ip_type_id`),
  ADD UNIQUE KEY `uq_ip_type` (`ip_type_name`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD UNIQUE KEY `uq_location` (`region`,`province`,`municipality`,`barangay`);

--
-- Indexes for table `objective_type`
--
ALTER TABLE `objective_type`
  ADD PRIMARY KEY (`objective_type_id`),
  ADD UNIQUE KEY `uq_objective_name` (`objective_name`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`),
  ADD UNIQUE KEY `uq_office_name` (`office_name`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`organization_id`),
  ADD UNIQUE KEY `uq_org_name` (`organization_name`),
  ADD KEY `fk_org_location` (`location_id`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`personnel_id`),
  ADD UNIQUE KEY `uq_personnel_email` (`email`),
  ADD KEY `ix_personnel_name` (`surname`,`given_name`),
  ADD KEY `fk_personnel_dept` (`department_id`),
  ADD KEY `fk_personnel_office` (`home_office_id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`program_id`),
  ADD UNIQUE KEY `uq_program_name` (`program_name`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD UNIQUE KEY `uq_proj_ref` (`proj_ref_no`),
  ADD KEY `ix_project_program` (`program_id`);

--
-- Indexes for table `project_role`
--
ALTER TABLE `project_role`
  ADD PRIMARY KEY (`project_role_id`),
  ADD UNIQUE KEY `uq_project_role` (`role_name`);

--
-- Indexes for table `research_project`
--
ALTER TABLE `research_project`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `fk_rp_activity` (`activity_id`,`activity_kind`);

--
-- Indexes for table `sdg`
--
ALTER TABLE `sdg`
  ADD PRIMARY KEY (`sdg_no`),
  ADD UNIQUE KEY `uq_sdg_name` (`sdg_name`);

--
-- Indexes for table `subject_area`
--
ALTER TABLE `subject_area`
  ADD PRIMARY KEY (`subject_area_id`),
  ADD UNIQUE KEY `uq_area_name` (`area_name`);

--
-- Indexes for table `target_group`
--
ALTER TABLE `target_group`
  ADD PRIMARY KEY (`target_group_id`),
  ADD UNIQUE KEY `uq_target_group` (`group_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_beneficiary`
--
ALTER TABLE `activity_beneficiary`
  MODIFY `activity_beneficiary_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_budget`
--
ALTER TABLE `activity_budget`
  MODIFY `budget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_status`
--
ALTER TABLE `activity_status`
  MODIFY `status_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `activity_type`
--
ALTER TABLE `activity_type`
  MODIFY `activity_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `agreement_type`
--
ALTER TABLE `agreement_type`
  MODIFY `agreement_type_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_role`
--
ALTER TABLE `app_role`
  MODIFY `role_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `audit_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beneficiary_class`
--
ALTER TABLE `beneficiary_class`
  MODIFY `class_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `commercialization_agreement`
--
ALTER TABLE `commercialization_agreement`
  MODIFY `agreement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commercialization_revenue`
--
ALTER TABLE `commercialization_revenue`
  MODIFY `revenue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `document_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `doc_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fund_source`
--
ALTER TABLE `fund_source`
  MODIFY `fund_source_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `institutionalization_level`
--
ALTER TABLE `institutionalization_level`
  MODIFY `level_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `intellectual_property`
--
ALTER TABLE `intellectual_property`
  MODIFY `ip_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_status`
--
ALTER TABLE `ip_status`
  MODIFY `ip_status_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ip_status_history`
--
ALTER TABLE `ip_status_history`
  MODIFY `history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_type`
--
ALTER TABLE `ip_type`
  MODIFY `ip_type_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objective_type`
--
ALTER TABLE `objective_type`
  MODIFY `objective_type_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `office_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `organization_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `personnel_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `program_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_role`
--
ALTER TABLE `project_role`
  MODIFY `project_role_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subject_area`
--
ALTER TABLE `subject_area`
  MODIFY `subject_area_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `target_group`
--
ALTER TABLE `target_group`
  MODIFY `target_group_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

-- --------------------------------------------------------

--
-- Structure for view `v_activity_summary`
--
DROP TABLE IF EXISTS `v_activity_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_activity_summary`  AS SELECT `a`.`activity_id` AS `activity_id`, `a`.`trace_no` AS `trace_no`, `a`.`activity_kind` AS `activity_kind`, `at`.`type_name` AS `type_name`, `s`.`status_name` AS `status_name`, `pr`.`proj_ref_no` AS `proj_ref_no`, `pr`.`project_name` AS `project_name`, `pg`.`program_name` AS `program_name`, `a`.`title` AS `title`, `a`.`start_date` AS `start_date`, `a`.`end_date` AS `end_date`, coalesce(`b`.`indicative_total`,0) AS `indicative_total`, coalesce(`b`.`actual_total`,0) AS `actual_total`, coalesce(`be`.`total_beneficiaries`,0) AS `total_beneficiaries` FROM (((((((`activity` `a` join `project` `pr` on(`pr`.`project_id` = `a`.`project_id`)) join `office` `o` on(`o`.`office_id` = `a`.`office_id`)) join `activity_type` `at` on(`at`.`activity_type_id` = `a`.`activity_type_id`)) join `activity_status` `s` on(`s`.`status_id` = `a`.`status_id`)) left join `program` `pg` on(`pg`.`program_id` = `pr`.`program_id`)) left join (select `activity_budget`.`activity_id` AS `activity_id`,sum(case when `activity_budget`.`budget_kind` = 'Indicative' then `activity_budget`.`amount` else 0 end) AS `indicative_total`,sum(case when `activity_budget`.`budget_kind` = 'Actual' then `activity_budget`.`amount` else 0 end) AS `actual_total` from `activity_budget` group by `activity_budget`.`activity_id`) `b` on(`b`.`activity_id` = `a`.`activity_id`)) left join (select `activity_beneficiary`.`activity_id` AS `activity_id`,sum(`activity_beneficiary`.`male_count` + `activity_beneficiary`.`female_count` + `activity_beneficiary`.`other_count`) AS `total_beneficiaries` from `activity_beneficiary` group by `activity_beneficiary`.`activity_id`) `be` on(`be`.`activity_id` = `a`.`activity_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_beneficiary_impact`
--
DROP TABLE IF EXISTS `v_beneficiary_impact`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_beneficiary_impact`  AS SELECT `bc`.`side` AS `side`, `bc`.`class_name` AS `class_name`, `tg`.`group_name` AS `target_group`, sum(`ab`.`male_count`) AS `male`, sum(`ab`.`female_count`) AS `female`, sum(`ab`.`other_count`) AS `other`, sum(`ab`.`male_count` + `ab`.`female_count` + `ab`.`other_count`) AS `total` FROM ((((`activity_beneficiary` `ab` join `activity` `a` on(`a`.`activity_id` = `ab`.`activity_id`)) join `office` `o` on(`o`.`office_id` = `a`.`office_id`)) join `beneficiary_class` `bc` on(`bc`.`class_id` = `ab`.`class_id`)) left join `target_group` `tg` on(`tg`.`target_group_id` = `ab`.`target_group_id`)) GROUP BY `bc`.`side`, `bc`.`class_name`, `tg`.`group_name` ;

-- --------------------------------------------------------

--
-- Structure for view `v_budget_by_office_fund`
--
DROP TABLE IF EXISTS `v_budget_by_office_fund`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_budget_by_office_fund`  AS SELECT `fs`.`fund_code` AS `fund_code`, `fs`.`source_name` AS `source_name`, sum(case when `ab`.`budget_kind` = 'Indicative' then `ab`.`amount` else 0 end) AS `indicative_total`, sum(case when `ab`.`budget_kind` = 'Actual' then `ab`.`amount` else 0 end) AS `actual_total` FROM (((`activity_budget` `ab` join `activity` `a` on(`a`.`activity_id` = `ab`.`activity_id`)) join `office` `o` on(`o`.`office_id` = `a`.`office_id`)) join `fund_source` `fs` on(`fs`.`fund_source_id` = `ab`.`fund_source_id`)) GROUP BY `fs`.`fund_code`, `fs`.`source_name` ;

-- --------------------------------------------------------

--
-- Structure for view `v_ip_portfolio`
--
DROP TABLE IF EXISTS `v_ip_portfolio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ip_portfolio`  AS SELECT `ip`.`ip_id` AS `ip_id`, `ip`.`reference_no` AS `reference_no`, `ip`.`ip_reg_no` AS `ip_reg_no`, `ip`.`title` AS `title`, `t`.`ip_type_name` AS `ip_type_name`, `st`.`ip_status_name` AS `ip_status_name`, `ip`.`date_filed` AS `date_filed`, `ip`.`date_registered` AS `date_registered`, `ip`.`expiry_date` AS `expiry_date`, count(distinct `ca`.`agreement_id`) AS `agreements`, coalesce(sum(`cr`.`amount`),0) AS `revenue_to_date` FROM ((((`intellectual_property` `ip` join `ip_type` `t` on(`t`.`ip_type_id` = `ip`.`ip_type_id`)) join `ip_status` `st` on(`st`.`ip_status_id` = `ip`.`current_status_id`)) left join `commercialization_agreement` `ca` on(`ca`.`ip_id` = `ip`.`ip_id`)) left join `commercialization_revenue` `cr` on(`cr`.`agreement_id` = `ca`.`agreement_id`)) GROUP BY `ip`.`ip_id`, `ip`.`reference_no`, `ip`.`ip_reg_no`, `ip`.`title`, `t`.`ip_type_name`, `st`.`ip_status_name`, `ip`.`date_filed`, `ip`.`date_registered`, `ip`.`expiry_date` ;

-- --------------------------------------------------------

--
-- Structure for view `v_project_overview`
--
DROP TABLE IF EXISTS `v_project_overview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_project_overview`  AS SELECT `pr`.`project_id` AS `project_id`, `pr`.`proj_ref_no` AS `proj_ref_no`, `pr`.`project_name` AS `project_name`, `pg`.`program_name` AS `program_name`, `x`.`offices` AS `offices`, `x`.`activity_count` AS `activity_count`, coalesce(`f`.`indicative_total`,0) AS `indicative_total`, coalesce(`f`.`actual_total`,0) AS `actual_total`, coalesce(`i`.`ip_count`,0) AS `ip_count` FROM ((((`project` `pr` left join `program` `pg` on(`pg`.`program_id` = `pr`.`program_id`)) left join (select `a`.`project_id` AS `project_id`,group_concat(distinct `o`.`office_name` order by `o`.`office_name` ASC separator ', ') AS `offices`,count(0) AS `activity_count` from (`activity` `a` join `office` `o` on(`o`.`office_id` = `a`.`office_id`)) group by `a`.`project_id`) `x` on(`x`.`project_id` = `pr`.`project_id`)) left join (select `a`.`project_id` AS `project_id`,sum(case when `b`.`budget_kind` = 'Indicative' then `b`.`amount` else 0 end) AS `indicative_total`,sum(case when `b`.`budget_kind` = 'Actual' then `b`.`amount` else 0 end) AS `actual_total` from (`activity` `a` join `activity_budget` `b` on(`b`.`activity_id` = `a`.`activity_id`)) group by `a`.`project_id`) `f` on(`f`.`project_id` = `pr`.`project_id`)) left join (select `intellectual_property`.`source_project_id` AS `project_id`,count(0) AS `ip_count` from `intellectual_property` where `intellectual_property`.`source_project_id` is not null group by `intellectual_property`.`source_project_id`) `i` on(`i`.`project_id` = `pr`.`project_id`)) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `fk_act_creator` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`),
  ADD CONSTRAINT `fk_act_objtype` FOREIGN KEY (`objective_type_id`) REFERENCES `objective_type` (`objective_type_id`),
  ADD CONSTRAINT `fk_act_office` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`),
  ADD CONSTRAINT `fk_act_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `fk_act_status` FOREIGN KEY (`status_id`) REFERENCES `activity_status` (`status_id`),
  ADD CONSTRAINT `fk_act_type` FOREIGN KEY (`activity_type_id`,`activity_kind`) REFERENCES `activity_type` (`activity_type_id`, `activity_kind`);

--
-- Constraints for table `activity_beneficiary`
--
ALTER TABLE `activity_beneficiary`
  ADD CONSTRAINT `fk_ab_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ab_class` FOREIGN KEY (`class_id`) REFERENCES `beneficiary_class` (`class_id`),
  ADD CONSTRAINT `fk_ab_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  ADD CONSTRAINT `fk_ab_target` FOREIGN KEY (`target_group_id`) REFERENCES `target_group` (`target_group_id`);

--
-- Constraints for table `activity_budget`
--
ALTER TABLE `activity_budget`
  ADD CONSTRAINT `fk_bud_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_bud_fund` FOREIGN KEY (`fund_source_id`) REFERENCES `fund_source` (`fund_source_id`);

--
-- Constraints for table `activity_flagship`
--
ALTER TABLE `activity_flagship`
  ADD CONSTRAINT `fk_af_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_af_flagship` FOREIGN KEY (`flagship_no`) REFERENCES `flagship_program` (`flagship_no`);

--
-- Constraints for table `activity_internal_unit`
--
ALTER TABLE `activity_internal_unit`
  ADD CONSTRAINT `fk_aiu_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_aiu_dept` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `activity_location`
--
ALTER TABLE `activity_location`
  ADD CONSTRAINT `fk_al_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_al_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `activity_partner`
--
ALTER TABLE `activity_partner`
  ADD CONSTRAINT `fk_apt_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_apt_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`);

--
-- Constraints for table `activity_personnel`
--
ALTER TABLE `activity_personnel`
  ADD CONSTRAINT `fk_ap_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ap_personnel` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`),
  ADD CONSTRAINT `fk_ap_role` FOREIGN KEY (`project_role_id`) REFERENCES `project_role` (`project_role_id`);

--
-- Constraints for table `activity_sdg`
--
ALTER TABLE `activity_sdg`
  ADD CONSTRAINT `fk_as_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_as_sdg` FOREIGN KEY (`sdg_no`) REFERENCES `sdg` (`sdg_no`);

--
-- Constraints for table `app_user`
--
ALTER TABLE `app_user`
  ADD CONSTRAINT `fk_user_office` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`),
  ADD CONSTRAINT `fk_user_personnel` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`),
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`role_id`);

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_audit_user` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`);

--
-- Constraints for table `commercialization_agreement`
--
ALTER TABLE `commercialization_agreement`
  ADD CONSTRAINT `fk_ca_ip` FOREIGN KEY (`ip_id`) REFERENCES `intellectual_property` (`ip_id`),
  ADD CONSTRAINT `fk_ca_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  ADD CONSTRAINT `fk_ca_type` FOREIGN KEY (`agreement_type_id`) REFERENCES `agreement_type` (`agreement_type_id`);

--
-- Constraints for table `commercialization_revenue`
--
ALTER TABLE `commercialization_revenue`
  ADD CONSTRAINT `fk_cr_agreement` FOREIGN KEY (`agreement_id`) REFERENCES `commercialization_agreement` (`agreement_id`);

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_doc_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`),
  ADD CONSTRAINT `fk_doc_agreement` FOREIGN KEY (`agreement_id`) REFERENCES `commercialization_agreement` (`agreement_id`),
  ADD CONSTRAINT `fk_doc_ip` FOREIGN KEY (`ip_id`) REFERENCES `intellectual_property` (`ip_id`),
  ADD CONSTRAINT `fk_doc_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `fk_doc_type` FOREIGN KEY (`doc_type_id`) REFERENCES `document_type` (`doc_type_id`),
  ADD CONSTRAINT `fk_doc_user` FOREIGN KEY (`uploaded_by`) REFERENCES `app_user` (`user_id`);

--
-- Constraints for table `extension_activity`
--
ALTER TABLE `extension_activity`
  ADD CONSTRAINT `fk_ea_activity` FOREIGN KEY (`activity_id`,`activity_kind`) REFERENCES `activity` (`activity_id`, `activity_kind`),
  ADD CONSTRAINT `fk_ea_dept` FOREIGN KEY (`implementing_dept_id`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `fk_ea_level` FOREIGN KEY (`level_id`) REFERENCES `institutionalization_level` (`level_id`),
  ADD CONSTRAINT `fk_ea_subject` FOREIGN KEY (`subject_area_id`) REFERENCES `subject_area` (`subject_area_id`);

--
-- Constraints for table `intellectual_property`
--
ALTER TABLE `intellectual_property`
  ADD CONSTRAINT `fk_ip_dept` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `fk_ip_fund` FOREIGN KEY (`filing_fund_source_id`) REFERENCES `fund_source` (`fund_source_id`),
  ADD CONSTRAINT `fk_ip_project` FOREIGN KEY (`source_project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `fk_ip_status` FOREIGN KEY (`current_status_id`) REFERENCES `ip_status` (`ip_status_id`),
  ADD CONSTRAINT `fk_ip_type` FOREIGN KEY (`ip_type_id`) REFERENCES `ip_type` (`ip_type_id`);

--
-- Constraints for table `ip_creator`
--
ALTER TABLE `ip_creator`
  ADD CONSTRAINT `fk_ic_ip` FOREIGN KEY (`ip_id`) REFERENCES `intellectual_property` (`ip_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ic_personnel` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`);

--
-- Constraints for table `ip_status_history`
--
ALTER TABLE `ip_status_history`
  ADD CONSTRAINT `fk_ish_ip` FOREIGN KEY (`ip_id`) REFERENCES `intellectual_property` (`ip_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ish_status` FOREIGN KEY (`ip_status_id`) REFERENCES `ip_status` (`ip_status_id`),
  ADD CONSTRAINT `fk_ish_user` FOREIGN KEY (`recorded_by`) REFERENCES `app_user` (`user_id`);

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `fk_org_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `fk_personnel_dept` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `fk_personnel_office` FOREIGN KEY (`home_office_id`) REFERENCES `office` (`office_id`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `fk_project_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`);

--
-- Constraints for table `research_project`
--
ALTER TABLE `research_project`
  ADD CONSTRAINT `fk_rp_activity` FOREIGN KEY (`activity_id`,`activity_kind`) REFERENCES `activity` (`activity_id`, `activity_kind`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
