-- ============================================================
-- update_employee_emails.sql
-- Bulk update emails ของพนักงาน — เอาไปรันใน Supabase SQL Editor
-- ============================================================
--
-- 📋 ขั้นตอนใช้งาน (HR):
--
-- 1. เปิด employees_emails_template.csv ใน Excel/Google Sheets
-- 2. กรอก email บริษัทของพนักงานทุกคนในคอลัมน์ email (คอลัมน์ H)
-- 3. ใช้ Excel formula สร้าง UPDATE statements:
--    =\"UPDATE employees SET email='\"&H3&\"' WHERE id=\"&A3&\";\"
--    (ลากสูตรทุกแถว → copy ทั้งหมด → paste แทนที่ตัวอย่างด้านล่าง)
-- 4. เปิด https://supabase.com/dashboard/project/vxcobdgptjcprexpktyd/sql/new
-- 5. Paste SQL ทั้งหมดด้านล่าง → กด Run (▶️)
-- 6. ตรวจผลด้วย SELECT statements ที่อยู่ท้ายไฟล์
--
-- ⚠️ ระวัง: รัน 1 ครั้ง update หลาย rows — ถ้ากรอก email ผิด ต้อง update ใหม่
--
-- 💡 Tips:
--   - email ต้องไม่ซ้ำกัน (unique per employee)
--   - ใช้ lowercase ดีกว่า (เช่น somchai@efin.co.th ไม่ใช่ SomChai@Efin.Co.Th)
--   - ถ้าพนักงานบางคนยังไม่มี email → ข้ามไป update ภายหลังได้
--
-- ============================================================

-- 🟢 STEP 1: เริ่ม transaction (ถ้า error rollback ได้)
BEGIN;

-- 🟢 STEP 2: UPDATE statements (แทนที่ตัวอย่างนี้ด้วยข้อมูลจริง)
-- ตัวอย่าง — generate จาก CSV ด้วยสูตร Excel:
-- =\"UPDATE employees SET email='\"&H3&\"' WHERE id=\"&A3&\";\"

-- === Admin ===
UPDATE employees SET email = '' WHERE id = 76;  -- นางสาวพรพรรณ พิทักษ์ (Admin Manager)
UPDATE employees SET email = '' WHERE id = 77;  -- นางสาวลลิตา ทองคำ (Admin Officer)
UPDATE employees SET email = '' WHERE id = 78;  -- นางสาวสุภาภรณ์ จันทร์เพ็ญ (Document Specialist)
UPDATE employees SET email = '' WHERE id = 79;  -- นายโกศล วัฒนะ (Procurement Officer)

-- === Content ===
UPDATE employees SET email = '' WHERE id = 59;  -- นางสาวณิชนันท์ วงศ์ปัญญา (Senior Content Editor) [manager]
UPDATE employees SET email = '' WHERE id = 60;  -- นายธนวัฒน์ ศรีจันทร์ (Content Writer)
UPDATE employees SET email = '' WHERE id = 61;  -- นางสาวกัญญา ใจดี (Content Writer)
UPDATE employees SET email = '' WHERE id = 62;  -- นายภูริพัฒน์ คำหวาน (News Writer)
UPDATE employees SET email = '' WHERE id = 63;  -- นางสาวอาทิตยา สมบูรณ์ (SEO Specialist)
UPDATE employees SET email = '' WHERE id = 64;  -- นายปฏิภาณ ตั้งใจ (Video Editor)

-- === Dev ===
UPDATE employees SET email = '' WHERE id = 1;   -- นายไพรวัลย์ ทองพล (Technical Lead) [manager]
UPDATE employees SET email = '' WHERE id = 2;   -- นายธีระชัย ทองเสม (Lead AI Engineer) [manager]
UPDATE employees SET email = '' WHERE id = 3;   -- นายณัฐพงษ์ เลิศวรสิริกุล (Senior Backend Developer)
UPDATE employees SET email = '' WHERE id = 4;   -- นายพิพัฒน์ เหล่ารักวิทย์ (AI Engineer)
UPDATE employees SET email = '' WHERE id = 5;   -- นายศรเทพ เหลาสิงห์ (Backend Developer)
UPDATE employees SET email = '' WHERE id = 8;   -- นายรังสรรค์ บุตรแก้ว (Backend Developer)
UPDATE employees SET email = '' WHERE id = 10;  -- นายเกียรติศักดิ์ จันทร์แจ่ม (Data Engineer)
UPDATE employees SET email = '' WHERE id = 14;  -- นางสาววิภาวี พุ่มเรือง (Head of Platform Engineer) [manager]
UPDATE employees SET email = '' WHERE id = 15;  -- นายชิตณรงค์ เพิ่มขึ้น (Software Developer)
UPDATE employees SET email = '' WHERE id = 16;  -- นางสาวเจนจิรา ลำเทียน (Senior Software Developer)
UPDATE employees SET email = '' WHERE id = 17;  -- นายซูเฟียน หลำเบ็ลสะ (Senior Software Developer)
UPDATE employees SET email = '' WHERE id = 18;  -- นางสาวนิธิมา สุหระ (Software Developer)
UPDATE employees SET email = '' WHERE id = 19;  -- นางสาวอารียา พรมนอก (Software Developer)
UPDATE employees SET email = '' WHERE id = 22;  -- นายก้องภพ หนูหมุน (Software Developer)
UPDATE employees SET email = '' WHERE id = 24;  -- นายภาณุพงศ์ กุลบุตร (Technical Lead) [manager]
UPDATE employees SET email = '' WHERE id = 26;  -- นายธนิสร ใจบุญ (Senior Software Engineer)
UPDATE employees SET email = '' WHERE id = 29;  -- นางสาวนภัสสร แสงเงินชัย (Mobile Developer)
UPDATE employees SET email = '' WHERE id = 30;  -- นายภานุวัฒน์ ดวงคำ (Software Developer)
UPDATE employees SET email = '' WHERE id = 31;  -- นายปพน สังข์ฤทธิ์ (Software Developer)
UPDATE employees SET email = '' WHERE id = 34;  -- นายพจวัฒน์ ผาพองยุน (DevOps Engineer)
UPDATE employees SET email = '' WHERE id = 35;  -- นายจูเลียน รีเวีย (Software Developer)
UPDATE employees SET email = '' WHERE id = 36;  -- นางสาวนิสาลักษณ์ บรรเทา (Senior Software Developer)
UPDATE employees SET email = '' WHERE id = 37;  -- นายภัทราวุธ วงษ์นิล (Senior Software Engineer)
UPDATE employees SET email = '' WHERE id = 38;  -- นายติณณภพ เดชมาก (Software Developer)
UPDATE employees SET email = '' WHERE id = 39;  -- นายยอดชาย ชะอุ่ม (Software Developer)
UPDATE employees SET email = '' WHERE id = 42;  -- นายชลกร ปัญจวิวัฒน์กุล (Software Engineer)
UPDATE employees SET email = '' WHERE id = 43;  -- นายรัฐกานต์ วาเพชร (Software Engineer)
UPDATE employees SET email = '' WHERE id = 44;  -- นายกฤษนันท์ วิเศษสุข (Senior Software Engineer)
UPDATE employees SET email = '' WHERE id = 45;  -- นางสมบัติศิริ เชาวกุล (Head BU IT Solution) [hr_admin]
UPDATE employees SET email = '' WHERE id = 48;  -- นายสุทธิเกียรติ ศิริสิทธิ์ (Lead Software Engineer)
UPDATE employees SET email = '' WHERE id = 49;  -- นางสาวณัฐธิดา รัตนมาลี (Senior Software Developer)
UPDATE employees SET email = '' WHERE id = 50;  -- นายอรรถกร สินอุดม (Senior Data Engineer)
UPDATE employees SET email = '' WHERE id = 51;  -- นายสุนทร อัญมณีโรจน์ (Chief Architect) [hr_admin]
UPDATE employees SET email = '' WHERE id = 53;  -- นางสาวศิริประภา เพชรเงินทอง (Technical Lead) [manager]
UPDATE employees SET email = '' WHERE id = 54;  -- นายวรกิจ ฤกษ์งาม (Lead Software Engineer) [manager]
UPDATE employees SET email = '' WHERE id = 55;  -- นายสุกฤต อรพรตระกูล (Operation Specialist)
UPDATE employees SET email = '' WHERE id = 56;  -- นายกิตติศักดิ์ นันต๊ะเสน (Software Developer)
UPDATE employees SET email = '' WHERE id = 57;  -- นายสุภธิติ กลิ่นทอง (Senior DBA)

-- === HR ===
UPDATE employees SET email = 'efinaihr@gmail.com' WHERE id = 80;  -- นางสาวดารุณี ระวังเหตุ (HR Manager) [hr_admin] ⚠️ ตั้งแล้ว
UPDATE employees SET email = '' WHERE id = 81;  -- นางสาวอินทิรา สุขสันต์ (HR Recruiter)
UPDATE employees SET email = '' WHERE id = 82;  -- นางสาววิลาวัลย์ ดวงแก้ว (HR Business Partner)
UPDATE employees SET email = '' WHERE id = 83;  -- นายเอกชัย รักงาน (L&D Specialist)

-- === Marketing ===
UPDATE employees SET email = '' WHERE id = 65;  -- นางสาวพิมพิดา พูลทรัพย์ (Head of Marketing) [manager]
UPDATE employees SET email = '' WHERE id = 66;  -- นายณัฐดนัย เลิศสกุล (Senior Marketing Manager) [manager]
UPDATE employees SET email = '' WHERE id = 67;  -- นางสาวธัญลักษณ์ ม่วงใหม (Digital Marketing Specialist)
UPDATE employees SET email = '' WHERE id = 68;  -- นายปวริศ ใจกล้า (Performance Marketing)
UPDATE employees SET email = '' WHERE id = 69;  -- นางสาวกมลชนก แสงทอง (Brand & PR Specialist)
UPDATE employees SET email = '' WHERE id = 70;  -- นายวรากร เด่นชัย (Marketing Analyst)

-- === Operations ===
UPDATE employees SET email = '' WHERE id = 6;   -- นายวิชญ์พล ขุนจำปี (Project Coordinator)
UPDATE employees SET email = '' WHERE id = 11;  -- นางสาวสิรภัทร เนมิตกนาม (Assistant Project Manager) [manager]
UPDATE employees SET email = '' WHERE id = 25;  -- นางสาวนุชบา กองณรงค์ (Senior Project Coordinator)
UPDATE employees SET email = '' WHERE id = 46;  -- นางสาวน้องใหม่ งอกงาม (Corporate Project Manager)
UPDATE employees SET email = '' WHERE id = 47;  -- นางสาวณัฐพร เลิศวรสิริกุล (Project Manager)
UPDATE employees SET email = '' WHERE id = 52;  -- นางสาวสุลิษา พลอยบุตร (Project Manager) [manager]
UPDATE employees SET email = '' WHERE id = 58;  -- นายไพทูรย์ บูรพาวิจิตรนนท์ (VP IT Project Manager) [hr_admin]
UPDATE employees SET email = '' WHERE id = 71;  -- นางสาวศิริพร พันธ์ทอง (Operations Manager) [manager]
UPDATE employees SET email = '' WHERE id = 72;  -- นายจักรพันธ์ คงดี (Operations Specialist)
UPDATE employees SET email = '' WHERE id = 73;  -- นางสาวพิชญา รัตนะ (Customer Success Lead) [manager]
UPDATE employees SET email = '' WHERE id = 74;  -- นายอนันต์ บัวศรี (Customer Service)
UPDATE employees SET email = '' WHERE id = 75;  -- นางสาวจิรัชยา ผ่องใส (Customer Service)

-- === QA ===
UPDATE employees SET email = '' WHERE id = 7;   -- นายพรรค์กวี โชควรุณรักษา (BA | QA)
UPDATE employees SET email = '' WHERE id = 9;   -- นางสาวนัฏฐณิชา วัฒนะงาม (Software Tester)
UPDATE employees SET email = '' WHERE id = 12;  -- นางสาววรรณภา เรืองโรจน์ (BA | QA)
UPDATE employees SET email = '' WHERE id = 13;  -- นายพีรวัส หวายโป่ง (BA | QA)
UPDATE employees SET email = '' WHERE id = 20;  -- นางสาวพรอรุณ เพ็งพิทักษ์ (BA | QA)
UPDATE employees SET email = '' WHERE id = 21;  -- นายณฐนนท์ นันทจิตตานนท์ (QA Engineer)
UPDATE employees SET email = '' WHERE id = 23;  -- นายศักดิ์สิทธิ์ ภูมิคำ (QA Engineer)
UPDATE employees SET email = '' WHERE id = 27;  -- นายณัฐพนธ์ ฐิติภัค (Software Tester)
UPDATE employees SET email = '' WHERE id = 28;  -- นางสาวทิฆัมพร นนทารมย์ (Project Coordinator | QA)
UPDATE employees SET email = '' WHERE id = 32;  -- นางสาวสุฑาทิพย์ กันดุลย์ (Software Tester)
UPDATE employees SET email = '' WHERE id = 33;  -- นางสาวเมรีย์ หมั่นดี (Senior Business Analyst)
UPDATE employees SET email = '' WHERE id = 40;  -- นางสาวปภาวรินท์ ณะมณี (Senior QA Engineer)
UPDATE employees SET email = '' WHERE id = 41;  -- นางสาวกุลธิดา เศรษฐพันธุ์ (QA Engineer)


-- 🟢 STEP 3: ตรวจผล (ก่อน commit)
-- ดูสรุปจำนวนคนที่มี/ไม่มี email
SELECT
  department,
  count(*) FILTER (WHERE email IS NULL OR email = '') AS missing_email,
  count(*) FILTER (WHERE email IS NOT NULL AND email <> '') AS has_email,
  count(*) AS total
FROM employees
GROUP BY department
ORDER BY department;

-- ดูคนที่ยังไม่มี email
SELECT id, full_name, department, position, role FROM employees
WHERE email IS NULL OR email = ''
ORDER BY department, id;

-- ตรวจ duplicate email (ห้ามมี)
SELECT email, count(*) AS dup_count
FROM employees
WHERE email IS NOT NULL AND email <> ''
GROUP BY email
HAVING count(*) > 1;


-- 🟢 STEP 4: ถ้าทุกอย่างถูกต้อง — Commit
COMMIT;

-- ❌ ถ้าผิด — Rollback (เปลี่ยน COMMIT ข้างบนเป็น ROLLBACK แล้วรันใหม่)
-- ROLLBACK;


-- ============================================================
-- 🚀 หลังจาก update เสร็จแล้ว:
-- ============================================================
--
-- 1. พนักงานทุกคนสามารถ login ที่ https://roiai-git-main-efinaihr-9594s-projects.vercel.app/login.html
-- 2. ใส่ email ของตัวเอง → กดส่ง Magic Link
-- 3. คลิก link ใน email → ระบบ link auth.users กับ employees.user_id ให้อัตโนมัติ
-- 4. ระบบ redirect ตาม role:
--    - role='employee' → /employee.html (กรอก monthly report)
--    - role='manager' → /manager.html (review ลูกทีม)
--    - role='hr_admin' → /index.html (ดู Dashboard ROI ทั้งหมด)
--
-- ============================================================
-- 📝 Notes สำหรับการ maintain ระบบ:
-- ============================================================
--
-- เพิ่มพนักงานใหม่:
--   INSERT INTO employees (emp_code, full_name, department, position, role, manager, salary, people_cost, email)
--   VALUES ('EMP084', 'นาย...', 'Dev', 'Software Developer', 'employee', 'นายหัวหน้า', 50000, 57500, 'newuser@efin.co.th');
--
-- เปลี่ยน email พนักงาน (ถ้ามี user_id แล้ว ต้องเปลี่ยน auth.users ด้วย):
--   UPDATE employees SET email = 'newemail@efin.co.th' WHERE id = 84;
--
-- พนักงานลาออก — ปิดสิทธิ์เข้าระบบ:
--   UPDATE employees SET user_id = NULL, email = NULL, has_license = false WHERE id = 84;
--   DELETE FROM auth.users WHERE id = 'xxxx-xxxx-xxxx';  -- ถ้าต้องการลบ auth user ด้วย
--
-- เปลี่ยน role:
--   UPDATE employees SET role = 'manager' WHERE id = 84;
--
-- ============================================================
