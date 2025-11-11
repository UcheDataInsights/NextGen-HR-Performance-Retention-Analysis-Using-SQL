# 💼 NextGen HR Analytics: SQL-Driven Insights for Workforce Optimization  

This project is an in-depth **HR analytics case study** conducted for **NextGen Corp**, a growing tech firm facing challenges in employee retention, performance inconsistencies, and salary imbalances. Using **PostgreSQL** and **SQL**, I analyzed key HR metrics to uncover trends, generate insights, and recommend data-driven strategies to improve workforce efficiency.

---

## 🏢 Business Overview

NextGen Corp is a technology company dedicated to developing innovative software and hardware solutions. The organization aims to attract top-tier talent and maintain high employee satisfaction — but has been facing rising concerns surrounding:

✅ Employee turnover  
✅ Performance variability  
✅ Salary disparities between roles & departments  



## ⚠️ Business Challenges

The HR department needed insights into:

- **Employee Turnover & Retention**  
  Identify departments and reasons behind high exit rates

- **Performance Evaluation**  
  Assess consistency and coaching needs across teams

- **Salary–Performance Alignment**  
  Understand whether compensation aligns with contributions

---

## 📂 Data Description

| Dataset | Description |
|--------|-------------|
| **Employees** | Name, role, hire date, salary, performance score, attendance %, department |
| **Departments** | Department list (Engineering, Sales, HR, Marketing, etc.) |
| **Performance** | Monthly employee performance records |
| **Attendance** | Presence/absence tracking |
| **Turnover** | Records of exits + reason for leaving |
| **Salaries** | Salary change history |



## 🧰 Tools & Technologies

- **Database:** PostgreSQL
- **Core Skills:** SQL (Advanced)
- **SQL Techniques:**

  ```sql
  JOINs, Aggregations, GROUP BY, CASE, AVG, COUNT, SUM, HAVING, ORDER BY, Subqueries
  ```


---

## 🎯 Key Business Questions

🔁 Employee

1. Who are the top 5 highest serving employees**?
<img width="1380" height="487" alt="Image" src="https://github.com/user-attachments/assets/bcdc96dd-e52d-486f-9a1e-6a94c098aba4" />

2. Which departments have the **highest turnover rates**?
<img width="826" height="541" alt="Image" src="https://github.com/user-attachments/assets/9ac10725-f366-4bdd-b3b7-44b2115eaff0" />

3. Which employees are at risk of leaving based on their performance?
<img width="1042" height="568" alt="Image" src="https://github.com/user-attachments/assets/79518367-6d9b-403c-a224-3bfd73878f5c" />

4. What are the **main reasons behind employee exits**?
<img width="767" height="440" alt="Image" src="https://github.com/user-attachments/assets/17d04096-0141-451d-ac03-a3e5d6c104a6" />


##
📈 Performance

1. How many employees have left the company?
<img width="546" height="386" alt="Image" src="https://github.com/user-attachments/assets/d917240c-79fb-4700-a726-163364b2021c" />

2. Who are the **top and bottom performers** by department?
<img width="1039" height="320" alt="Image" src="https://github.com/user-attachments/assets/c6e96b1c-989d-4697-a9fb-72777c2e1d1d" />

3. How is **performance distributed** across departments on average?
<img width="789" height="446" alt="Image" src="https://github.com/user-attachments/assets/47d17f7e-3fb7-404e-956b-c6aadc2d9a19" />

4. What is the average performance score by department?
<img width="628" height="493" alt="Image" src="https://github.com/user-attachments/assets/e82b35ba-a06b-4483-97c2-810bf3841ed8" />


##
💰 Salary

1. What is the total salary expense for the company?
<img width="810" height="335" alt="Image" src="https://github.com/user-attachments/assets/1f8c48aa-0e78-4e6a-8b79-554e4d7e4776" />

2. What is the average salary by job title?
<img width="964" height="493" alt="Image" src="https://github.com/user-attachments/assets/8f249795-0d52-4356-9f45-0b31ee881b3a" />

3. How many employees earn above 80,000?
<img width="481" height="361" alt="Image" src="https://github.com/user-attachments/assets/118faf19-8c6d-4fd4-8210-8866024eb261" />

4. How does performance correlate with salary across departments?
<img width="776" height="572" alt="Image" src="https://github.com/user-attachments/assets/3050b1f3-d93b-4f94-96ba-f796be810b19" />

---

## 📊 Key Insights 

🧩 Retention

- Employees with **longer tenure** demonstrate strong **loyalty and stability**, with many having been with the company since its early days.  
- **Marketing** shows the **highest turnover rate**, highlighting the need for **targeted retention strategies**.  
- **Engineering** reports **moderate to high turnover (66%)**, suggesting potential issues with workload, culture, or incentives — though this may also reflect **competitive poaching** in the market.  
- **Sales** and **HR** maintain **healthy turnover levels (27%)**, consistent with typical industry benchmarks (10–30%).  
- **Exit reasons** indicate both **pull factors** (e.g., new opportunities) and **push factors** (e.g., dissatisfaction or limited career growth).  
  - The **Personal** category ranks highest, often linked to factors like family or health.



## 📈 Performance

- Over **70 employees** have performance scores **below 3.5**, representing a key opportunity for **coaching and development**.  
- **Marketing** demonstrates both **high and low performers**, implying **inconsistent management practices**.  
- Departments with persistently low performance scores often **lack structured coaching or feedback programs**.  



## 💰 Salary

- **Total salary expense:** **$4,850,000**.  
- There is a clear **misalignment between salary and performance**, where several **underperforming employees receive above-average compensation**.  
- Example: Employees earning **~$100K** with **low performance ratings** reflect **inefficient pay-to-performance alignment** and warrant review of **compensation strategy**.  

---


## 💡 Recommendations

The data reveals several areas for strategic improvement and operational enhancement:

- **Strengthen Retention:** Prioritize Marketing and Engineering, which face the highest turnover challenges.  
- **Standardize Performance Management:** Implement consistent frameworks across all departments to ensure fairness and accountability.  
- **Targeted Training:** Invest in development programs for underperforming teams to improve overall productivity.  
- **Recognize High Performers:** Introduce rewards such as certifications, mentorships, and performance-based bonuses to retain top talent.  
- **Retention Focus:** Conduct **stay interviews** in Marketing and Engineering to identify and address root causes of employee churn.  
- **Reassess Compensation Structures:** Align pay more closely with performance outcomes and ensure competitive salary positioning.  
- **Compensation Strategy Review:** Regularly evaluate market competitiveness and adjust salary bands as needed.  
- **Attendance Incentives:** Launch **attendance-based rewards** to foster engagement and consistency.  
- **Automation:** Utilize **SQL views** and **stored procedures** to automate quarterly performance dashboards for data-driven monitoring.



## 🚀 Conclusion

While most departments maintain strong average performance, analysis indicates that **Marketing and Engineering**, despite being high-performing, are **underpaid relative to peers** and suffer from **critical turnover rates (up to 92%)**.  
Exit reasons such as *career growth, better job offers, and personal factors* suggest that employees may feel **undervalued or unsupported** in their professional progression.


### Leadership Recommendations

✅ **Align Compensation with Performance:** Ensure pay equity and reward high-performing employees proportionally.  
✅ **Enhance Career Development:** Provide clear advancement pathways to reduce exits driven by limited growth opportunities.  
✅ **Implement Retention Strategies:** Use stay interviews, flexible work arrangements, and recognition programs to improve engagement.  
✅ **Leverage Data Analytics:** Monitor workforce metrics via integrated dashboards to track trends in **salary**, **performance**, and **turnover** in real time.

---

## 💡 Project Impact

Leveraging **SQL analytics**, this project delivered **actionable insights** into HR performance, salary alignment, and retention patterns.  
These findings empower **NextGen Corp** to:

- Boost **employee satisfaction and loyalty**  
- **Reward top performers** effectively  
- Optimize **compensation and retention strategies**  
- Drive **data-informed HR decision-making**
— Enabling more confident, people-focused HR decisions.

---

## ✨ Final Project Statement

> **“Turning HR data into actionable People Insights — empowering NextGen Corp to attract, retain, and grow top talent.”**
> 


