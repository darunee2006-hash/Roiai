# 📘 คู่มือการใช้งาน · efin AI Productivity & ROI Evaluation Framework

> ระบบประเมิน ROI ของพนักงานที่ใช้ AI vs ไม่ใช้ AI · แยกจากระบบ HR · รอบประเมิน 90 วัน

---

## สารบัญ

1. [ภาพรวมระบบ](#1-ภาพรวมระบบ)
2. [วิธีเข้าใช้งาน (Login + 4 หน้า)](#2-วิธีเข้าใช้งาน-login--4-หน้า)
3. [ทำความเข้าใจ 9 แท็บใน Dashboard](#3-ทำความเข้าใจ-9-แท็บใน-dashboard)
4. [4 กลุ่มพนักงาน · ความหมาย + การจัดการ](#4-4-กลุ่มพนักงาน--ความหมาย--การจัดการ)
5. [5 ROI Bands · เกณฑ์ตีความผล](#5-5-roi-bands--เกณฑ์ตีความผล)
6. [สูตรคำนวณทั้งหมด](#6-สูตรคำนวณทั้งหมด)
7. [Flow การเก็บข้อมูล 11 ขั้นตอน](#7-flow-การเก็บข้อมูล-11-ขั้นตอน)
8. [คู่มือแยกตาม Role (พร้อม screenshot flow)](#8-คู่มือแยกตาม-role)
9. [การจัดการข้อมูล (เพิ่ม/แก้/ลบ)](#9-การจัดการข้อมูล-เพิ่มแก้ลบ)
10. [Onboarding พนักงาน — ตั้ง email + ส่ง login link](#10-onboarding-พนักงาน)
11. [Maintenance & Update Code](#11-maintenance--update-code)
12. [Troubleshooting](#12-troubleshooting)
13. [FAQ](#13-faq)

---

## 1. ภาพรวมระบบ

### 1.1 ระบบนี้ตอบคำถามอะไร?

หัวใจหลัก คือ **ตอบคำถามเดียว**:

> **"พนักงานที่ใช้ AI สร้างมูลค่าเพิ่มกว่าพนักงานที่ไม่ใช้ AI เท่าไร?"**
>
> **"ทุก 1 บาทที่บริษัทลงทุนกับ AI ได้ผลตอบแทนกลับมากี่บาท?"**

### 1.2 องค์ประกอบหลัก

```
┌─────────────────────────────────────────────────────────┐
│   เบราว์เซอร์ (HR/Manager/ผู้บริหาร)                     │
└────────────────────────┬────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│   Vercel · Static Dashboard (HTML+JS)                   │
│   https://roiai-git-main-efinaihr-9594s-projects.vercel.app │
└────────────────────────┬────────────────────────────────┘
                         │ Live data
                         ▼
┌─────────────────────────────────────────────────────────┐
│   Supabase Postgres · Project: efin-ai-roi              │
│   8 tables + 1 view (แยกจาก hr-system)                  │
└─────────────────────────────────────────────────────────┘
```

### 1.3 ลิงก์สำคัญ

| ระบบ | URL |
|---|---|
| 🌐 **Dashboard (Live)** | https://roiai-git-main-efinaihr-9594s-projects.vercel.app |
| 🐙 **GitHub Repo** | https://github.com/darunee2006-hash/Roiai |
| ⚡ **Vercel Project** | https://vercel.com/efinaihr-9594s-projects/roiai |
| 💾 **Supabase Studio** | https://supabase.com/dashboard/project/vxcobdgptjcprexpktyd |

---

## 2. วิธีเข้าใช้งาน (Login + 4 หน้า)

### 2.1 ระบบ Authentication — Magic Link (ไม่ต้องจำ password)

ระบบใช้ **Magic Link** ของ Supabase Auth — ปลอดภัย ไม่ต้องจำ password

**ขั้นตอน login (ครั้งแรก):**

1. เปิด **https://roiai-git-main-efinaihr-9594s-projects.vercel.app/login.html**
2. ใส่ email บริษัทของคุณ (ที่ HR ตั้งไว้แล้ว)
3. กด **"ส่ง Magic Link →"**
4. เปิด email ที่ส่งมา — ชื่อหัวข้อ **"Confirm Your Signup"** หรือ **"Your Magic Link"**
5. คลิกลิงก์ในเมล — ระบบจะ login อัตโนมัติและ redirect ตาม role:
   - 👤 **Employee** → `/employee.html` (กรอก monthly report)
   - 👨‍💼 **Manager** → `/manager.html` (validate ลูกทีม)
   - 🏛 **HR Admin** → `/index.html` (ROI Dashboard ทั้งระบบ)
6. ครั้งถัดไป login ใช้ flow เดียวกัน — session อยู่ได้ ~1 สัปดาห์

> ⚠️ **ถ้าใส่ email แล้วเจอ "ไม่พบในระบบ"**: HR ยังไม่ได้ตั้ง email ในตาราง `employees` — ให้แจ้ง HR เพิ่ม

### 2.2 4 หน้าในระบบ — เลือกตาม Role

| Page | URL | สำหรับ | สรุปสิ่งที่ทำได้ |
|---|---|---|---|
| 🔑 **Login** | `/login.html` | ทุกคน | ใส่ email → รับ Magic Link |
| 📝 **Employee** | `/employee.html` | พนักงานทุกคน | กรอก monthly report + แนบหลักฐาน + ดู ROI ตัวเอง |
| 👨‍💼 **Manager** | `/manager.html` | หัวหน้างาน | review ลูกทีม + ใส่ AI Contribution % + Approve/Reject |
| 📊 **Dashboard** | `/index.html` | HR Admin | ดู ROI ทั้งองค์กร · 9 แท็บ · เปรียบเทียบฝ่าย/บุคคล |

### 2.3 ตัวกรองใน Dashboard (HR view เท่านั้น)

มุมขวาบนของ dashboard มี 2 dropdowns:

- **ฝ่าย**: เลือกเฉพาะฝ่ายที่ต้องการดู (Dev, QA, Content, Marketing, Operations, Admin, HR)
- **กลุ่ม**: Champion / Adopter / Beginner / Non-User

> 💡 ตัวกรองทำงานพร้อมกัน — เลือก "ฝ่าย: Dev" + "กลุ่ม: Champion" เพื่อดู AI Champion ของฝ่าย Dev เท่านั้น

---

## 3. ทำความเข้าใจ 9 แท็บใน Dashboard

### 📋 แท็บ 1 · Executive Summary

**สำหรับ:** ผู้บริหาร · บอร์ด · CEO

**ตัวเลขสำคัญ 4 ตัว:**

| KPI | ความหมาย |
|---|---|
| AI ROI (Adjusted) | ROI สุทธิหลังหัก AI Contribution % แล้ว — ตัวเลขนี้คือเลขจริง |
| Net Benefit / เดือน | ผลประโยชน์สุทธิ (Adjusted Benefit − AI Cost) |
| Hours Saved รวม | ชั่วโมงที่พนักงานทุกคนประหยัดได้รวม / เดือน |
| Active License Rate | % ของ License ที่ใช้จริง (ของซื้อมาแล้วใช้คุ้มแค่ไหน) |

**ตารางสรุป** — ทุกตัวเลขที่ต้องเสนอผู้บริหาร พร้อมใช้

### 📊 แท็บ 2 · Overview

4 chart หลัก:
- **มูลค่าผลประโยชน์ตามฝ่าย** (Total vs Adjusted Benefit) — ฝ่ายไหนสร้าง value มากที่สุด
- **Productivity Multiplier ตามฝ่าย** — งาน output เพิ่มกี่เท่า
- **AI Adoption Rate ตามฝ่าย** — ฝ่ายไหนใช้ AI มาก/น้อย
- **Quality (Error Rate %)** — ฝ่ายไหน error ลดลงดีที่สุด

### ⚖️ แท็บ 3 · AI vs Non-AI

**สำคัญที่สุด** สำหรับการตอบคำถาม "ใช้ AI vs ไม่ใช้ ต่างกันแค่ไหน":

- **เปรียบเทียบ 4 มิติ**: Multiplier · Time Saving % · Quality Improvement % · AI Contribution %
- **Time-to-Complete**: AI Users ใช้เวลาน้อยกว่า Non-Users กี่ ชม. ต่อชิ้นงาน
- **Pair-wise Comparison**: เปรียบเทียบ **ในฝ่ายเดียวกัน** เพื่อความยุติธรรม (Dev AI vs Dev Non-AI · ไม่นำ Dev ไปเทียบกับ HR)

### 🏢 แท็บ 4 · By Department

**ตารางคะแนนรายฝ่าย** — แสดงทุก KPI ของ 7 ฝ่ายเทียบกัน:

| คอลัมน์ | คำอธิบาย |
|---|---|
| Headcount | จำนวนพนักงานทั้งหมด |
| AI Users | จำนวนคนใช้ AI (Champion + Adopter + Beginner) |
| Adoption % | สัดส่วนคนใช้ AI |
| Avg Multiplier | output multiplier เฉลี่ย (1.0x = เท่าเดิม, 2.0x = สองเท่า) |
| Avg AI Contrib % | หัวหน้าประเมินว่าผลลัพธ์เกิดจาก AI กี่ % |
| Total Benefit | มูลค่ารวม (ก่อนหัก AI Contribution) |
| Adjusted Benefit | มูลค่าหลังคูณ AI Contribution % (ตัวเลขจริง) |
| ROI % | (Adjusted Benefit − Cost) ÷ Cost × 100 |

**Verdict**: Vercel ใส่สีให้แต่ละแถวตาม ROI bands → คุ้มมาก / คุ้ม / เริ่มคุ้ม / ติดลบ

### 👥 แท็บ 5 · Employees

**ตาราง ROI รายบุคคล** ทั้ง 83 คน:

- **ค้นหา**: พิมพ์ชื่อ/ตำแหน่ง
- **เรียง**: Adjusted ROI สูง→ต่ำ · Benefit · AI Contribution % · ฝ่าย
- **คอลัมน์สำคัญ**:
  - `Out Δ`: output ก่อน → หลัง (ตัวเลขชี้ productivity)
  - `Hrs Saved`: ชั่วโมงประหยัดได้ / เดือน
  - `Total Benefit`: มูลค่ารวม
  - `AI Contrib %`: หัวหน้าประเมิน
  - `Adj Benefit`: มูลค่าจริงหลังหัก contribution
  - `Adj ROI %`: ROI หลังปรับ
  - ⚠️ **WASTE**: คนมี License แต่ไม่ใช้ — License ซื้อมาเสียเปล่า

### 🏆 แท็บ 6 · Champion / Risk

2 รายการสำคัญ:

**🏆 AI Champion List** (Top 12)
- คนที่ ROI สูงสุด · งานดีขึ้นชัด
- **Action**: ตั้งเป็นต้นแบบ · ให้สอนทีมอื่น · Reward / Promote

**⚠️ Non-Adoption Risk** (Bottom 12)
- Non-User + Beginner ที่ Adjusted Benefit ต่ำ + คนที่ License ไม่ใช้
- **Action**: PIP 90 วัน · Coaching · พิจารณาโอน License

### 🔄 แท็บ 7 · Data Flow

**Flow 11 ขั้นตอน** ตั้งแต่ Finance/IT บันทึกต้นทุน AI → ผู้บริหารตัดสินใจ พร้อมระบุ **เจ้าของข้อมูลแต่ละขั้น**

**Monthly Cycle** — กำหนดการ 30 วัน ใครต้องทำอะไรในวันที่เท่าไร

### 🎯 แท็บ 8 · Decision Tree

5 scenario การตัดสินใจหลังได้ผล ROI:

| สถานการณ์ | Action |
|---|---|
| ROI สูง + ใช้งานจริง | ขยาย License + Champion |
| ROI กลาง + ใช้งานจริง | อบรมเพิ่ม + Use Case ใหม่ |
| ROI ต่ำ + ใช้งานน้อย | เปลี่ยน Tool / Coaching |
| ROI ติดลบ + ไม่ใช้ | ยกเลิก License |
| ROI สูงเฉพาะบางทีม | ใช้เป็น Pilot Model |

### 📚 แท็บ 9 · Methodology

สูตรคำนวณทั้งหมด · AI Contribution % เกณฑ์ · KPI definition · 4 ชั้นตรวจสอบ

---

## 4. 4 กลุ่มพนักงาน · ความหมาย + การจัดการ

ระบบแบ่งพนักงานเป็น **4 กลุ่ม** ตามระดับการใช้ AI:

### 🏆 AI Champion (~13% ของบริษัท)
- **เกณฑ์**: ใช้ AI ทุกวัน · output multiplier ใกล้เคียงเป้า phase 3 · AI Contribution 70-90%
- **Action**:
  - 🎁 **Reward**: Bonus · ขึ้นเงินเดือน · Promote
  - 👑 **Mentor role**: ให้สอนทีมอื่น · ทำ workshop
  - 📋 ทำเป็น **playbook** ให้องค์กร

### 🚀 AI Adopter (~50% ของบริษัท)
- **เกณฑ์**: ใช้ AI สม่ำเสมอ 3-5 วัน/สัปดาห์ · multiplier 1.5-2.0x · AI Contribution 50-75%
- **Action**:
  - 📚 อบรมเพิ่ม · ให้ use case ใหม่
  - 🤝 จับคู่กับ Champion เพื่อเรียนรู้
  - 🎯 ขยับเป้า Phase ถัดไป

### 🌱 AI Beginner (~20%)
- **เกณฑ์**: เริ่มใช้ 1-3 วัน/สัปดาห์ · multiplier 1.0-1.5x · AI Contribution 30-55%
- **Action**:
  - 🛠 **Workshop**: ใช้ AI พื้นฐาน
  - 📝 **Prompt template library** — ให้ template ใช้งานจริง
  - 👨‍🏫 **1:1 coaching** กับ Champion
  - ตั้งเป้า KPI ใช้ AI ≥ 3 วัน/สัปดาห์

### ⚪ Non-AI User (~17%)
- **เกณฑ์**: ไม่ใช้ AI หรือใช้น้อยกว่า 1 วัน/สัปดาห์
- **Action**:
  - 🚦 **Pilot 30 วัน**: หัวหน้าเลือก use case ให้ทดลอง
  - ⏰ ถ้าไม่ขยับ → **PIP 90 วัน**
  - 🔄 ถ้ายังไม่ผ่าน → **โอน License** ให้คนอื่น
  - หรือเปลี่ยน tool เป็นที่เหมาะกว่า

---

## 5. 5 ROI Bands · เกณฑ์ตีความผล

| Band | ROI | การตีความ | Action |
|---|---|---|---|
| 🟢 **คุ้มมาก** | > 300% | ทุก 1฿ → 4฿+ | **ขยายผลทั้งทีม** · ทำเป็น playbook |
| 🔵 **คุ้ม** | 100–300% | 1฿ → 2-4฿ | **ใช้ต่อ** · ปรับ process · ขยับเป้า |
| 🟡 **เริ่มคุ้ม** | 0–100% | 1฿ → 1-2฿ | **อบรมเพิ่ม** · ปรับ use case |
| 🔴 **ติดลบ** | < 0% | ขาดทุน | **ทบทวน** · เปลี่ยน Tool · พิจารณา PIP |
| ⚠️ **License สูญเปล่า** | N/A | License มีแต่ไม่ใช้ | **โอน/ยกเลิก** License |

> 📌 ระบบเราตอนนี้ **ROI ~1,459%** = อยู่ในระดับ "คุ้มมาก" ทุก 1฿ ลงทุนได้คืน ~15.6฿

---

## 6. สูตรคำนวณทั้งหมด

### 6.1 ค่าแรงต่อชั่วโมง

```
Hourly Rate = Salary (หรือ People Cost) ÷ 176 ชั่วโมง/เดือน
```

> 💡 **People Cost** = เงินเดือน + ประกันสังคม + สวัสดิการ + Bonus เฉลี่ย — แม่นยำกว่าใช้แค่เงินเดือน

### 6.2 ชั่วโมงที่ประหยัดได้ / เดือน

```
Hours Saved = (เวลาก่อน − เวลาหลัง) × Output หลัง
```

ตัวอย่าง: ก่อน 3 ชม./ชิ้น · หลัง 1.5 ชม./ชิ้น · ทำได้ 32 ชิ้น/เดือน
→ Hours Saved = (3 − 1.5) × 32 = **48 ชั่วโมง/เดือน**

### 6.3 มูลค่าเวลาที่ประหยัดได้

```
Value Saved = Hours Saved × Hourly Rate
```

ตัวอย่าง: 48 ชม. × 200 ฿/ชม. = **9,600 ฿/เดือน**

### 6.4 ผลประโยชน์รวม

```
Total Benefit = Value Saved + Added Revenue + Cost Reduction
```

โดย:
- **Added Revenue** = รายได้ที่เพิ่มจากการใช้ AI (Sales/Marketing เป็นหลัก)
- **Cost Reduction** = OT ลด · Outsource ลด

### 6.5 Adjusted Benefit (สำคัญ — เพื่อความยุติธรรม)

```
Adjusted Benefit = Total Benefit × AI Contribution %
```

> 💡 หัวหน้าประเมินว่าผลลัพธ์ "เกิดจาก AI" กี่ % เพื่อกัน revenue/output ที่อาจมาจากปัจจัยอื่น (ลูกค้าเพิ่ม · ทีมช่วย · ฯลฯ)

| AI Contribution % | ความหมาย |
|---|---|
| 100% | เกิดจาก AI ทั้งหมด |
| 70% | AI เป็นปัจจัยหลัก |
| 50% | AI ช่วยครึ่งหนึ่ง |
| 30% | AI ช่วยบางส่วน |
| 0% | ไม่เกี่ยวกับ AI |

### 6.6 Adjusted ROI

```
Adjusted ROI (%) = (Adjusted Benefit − AI Cost) ÷ AI Cost × 100
```

### 6.7 ต้นทุน AI ต่อคน / เดือน

```
AI Cost = License Cost + (Training Cost ÷ 12) + (Setup Cost ÷ 24)
```

ค่าใช้จ่ายมาตรฐาน:
- Claude Code Max: ~3,500 ฿/เดือน (~$100)
- Claude (Cowork): ~2,500 ฿/เดือน
- Cursor / Copilot: ~700-800 ฿/เดือน
- Training amortized: ~420 ฿/เดือน (5,000 ÷ 12)

### 6.8 AI Productivity Score (100 คะแนน)

| มิติ | น้ำหนัก |
|---|---|
| ⏱ ประหยัดเวลา | 30 |
| 📦 เพิ่ม Output | 25 |
| ✨ คุณภาพงานดีขึ้น | 20 |
| 💰 ผลลัพธ์ทางธุรกิจ | 15 |
| 📅 ใช้สม่ำเสมอ | 10 |
| **รวม** | **100** |

---

## 7. Flow การเก็บข้อมูล 11 ขั้นตอน

> ใช้รอบ **30 วัน/เดือน** เก็บข้อมูลซ้ำๆ ดู trend ระยะยาว

### กำหนดการ 1 เดือน

| วันที่ | ผู้รับผิดชอบ | สิ่งที่ต้องทำ |
|---|---|---|
| 1–3 | Finance / IT | อัปเดตต้นทุน AI · จำนวน License ที่ใช้งานจริง |
| 4–7 | HR | ส่ง Google Form ให้พนักงานทุกคน |
| 8–12 | **พนักงาน** | กรอกผลงาน · เวลา · ตัวอย่าง output ที่ AI ช่วย |
| 13–17 | **หัวหน้า** | Validate ตัวเลข · ใส่ AI Contribution % · ใส่คะแนน |
| 18–22 | HR / Data | คำนวณ ROI ทุกคน · update Supabase |
| 23–25 | HR / Mgmt | Review Dashboard · เตรียมประชุม |
| 26–30 | ผู้บริหาร | ตัดสินใจ ต่อ/ขยาย/ลด/เปลี่ยน Tool |

### 4 ชั้นตรวจสอบ — ป้องกันกรอกตัวเลขเกินจริง

```
1. Self Report   →  พนักงานกรอกเอง
2. Manager Validate  →  หัวหน้ายืนยัน + ใส่ AI Contribution %
3. Evidence    →  แนบไฟล์ / ลิงก์ / Prompt / Output
4. System Data    →  เทียบกับ Jira / GA / CRM / HRIS
```

ทั้ง 4 ชั้นต้องผ่าน ถึงจะนับเป็นข้อมูลที่ใช้คำนวณ ROI

---

## 8. คู่มือแยกตาม Role

---

### 👤 สำหรับพนักงาน (Employee) — `/employee.html`

**Workflow รายเดือน:**

```
Login → กรอกฟอร์ม → Submit → รอหัวหน้า approve → ดู ROI ตัวเอง
```

**ขั้นตอนละเอียด:**

1. **Login** ที่ https://roiai-git-main-efinaihr-9594s-projects.vercel.app/login.html → ใส่ email → คลิก Magic Link
2. หน้า `/employee.html` จะเปิดอัตโนมัติ — เห็น:
   - ฝ่าย / หัวหน้า / Baseline เดิม (Output ก่อน + เวลาก่อน AI)
   - ฟอร์ม "📝 บันทึกผลงานเดือนนี้"
3. **กรอกฟอร์ม** (ทุกฟิลด์ที่มีสีแดง `*` คือบังคับ):
   - **เดือนที่รายงาน**: เลือกเดือนปัจจุบัน (auto-fill)
   - **AI Tool ที่ใช้**: Claude Code / Cursor / ChatGPT / Gemini ฯลฯ
   - **ระดับการใช้ AI**: Champion (ใช้ทุกวัน) / Adopter / Beginner / Non-User
   - **ใช้ AI กี่วัน/สัปดาห์**: 0-7
   - **📦 จำนวน Output เดือนนี้**: เช่น 32 ชิ้นงาน
   - **⏱ เวลาต่อชิ้น (ชม.)**: เช่น 1.5 ชม. หลังใช้ AI
4. **ดู "ชั่วโมงที่ประหยัดได้/เดือน"** — กล่องสีฟ้าด้านล่าง auto-calc ทันที
5. **📎 แนบลิงก์หลักฐาน** (สำคัญ!) — ใส่ 1 บรรทัด/ลิงก์:
   - ลิงก์ Google Doc / Drive ของงานที่ AI ช่วย
   - ลิงก์ GitHub PR / commit
   - Screenshot prompt + output
   - ⚠️ ไม่มีหลักฐาน → หัวหน้า reject ได้
6. **ใส่ Self Rating 1-5** + **Comment** เพิ่มเติม
7. **เลือก action**:
   - 💾 **"บันทึก Draft"** — เก็บไว้แก้ภายหลัง (ยังไม่ส่งหัวหน้า)
   - ✅ **"ส่งให้หัวหน้า Review →"** — ส่งทันที (status = pending)
8. หลังส่ง — ดู "📂 ประวัติรายงานของฉัน" ด้านล่าง — แต่ละ row แสดง status:
   - ⏳ **รอ Validate** (pending) — หัวหน้ายังไม่ดู
   - ✅ **Approved** — เข้า Dashboard แล้ว
   - ❌ **Rejected** — ต้องแก้แล้วส่งใหม่
   - 💾 **Draft** — ยังไม่ส่ง
9. **ทุกเดือน** ทำซ้ำขั้นตอน 1-8 (เลือกเดือนใหม่)

> 💡 **ก่อนใช้ AI ครั้งแรก** ต้องมี Baseline (ตัวเลขก่อนใช้ AI) — HR จะ insert ให้ตอน onboarding

---

### 👨‍💼 สำหรับหัวหน้างาน (Manager) — `/manager.html`

**Workflow รายเดือน (ช่วงวันที่ 13-17):**

```
Login → เห็นรายการลูกทีมรอ validate → review ทีละคน → ใส่คะแนน + AI Contribution % → Approve
```

**ขั้นตอนละเอียด:**

1. **Login** ปกติ → ระบบ redirect ไป `/manager.html` อัตโนมัติ
2. หน้าแสดง **3 KPI** บน:
   - ⏳ จำนวนรอ Validate (จะเปลี่ยนเป็น 0 เมื่อ approve หมด)
   - ✅ Approved (เดือนนี้)
   - 👥 ลูกทีม (จำนวน)
   - ⌀ AI Contribution % เฉลี่ย
3. **3 แท็บ**:
   - **⏳ รอ Validate** — รายการ pending reports (default)
   - **✅ Approved** — ที่ approve แล้ว
   - **👥 ลูกทีม** — รายชื่อลูกทีมพร้อม last report status
4. **Review รายงานแต่ละคน**:
   - ดู Output เปลี่ยนแปลง (ก่อน → หลัง) + % เพิ่ม
   - ดูเวลาที่เปลี่ยน (ชม./ชิ้น)
   - ดู **Hours Saved** ที่คำนวณอัตโนมัติ
   - ดู **📎 หลักฐาน** ที่ลูกทีมแนบ — คลิกเปิดดูได้
   - ดู Comment ของลูกทีม
5. **กด "✏️ Review + ใส่ AI Contribution %"** → ฟอร์ม validation จะเปิด
6. **ให้คะแนน 1-5 ใน 4 มิติ**:
   - เร็วขึ้น (Speed)
   - Output (ปริมาณ)
   - คุณภาพ (Quality)
   - Business Impact
7. **🎯 ใส่ AI Contribution % (สำคัญที่สุด!)**:
   - Slider 0-100% — ลากเลือกค่า
   - 100% = AI ทำทั้งหมด · 70% = หลัก · 50% = ครึ่ง · 30% = บางส่วน · 0% = ไม่เกี่ยว
   - ⚠️ อย่าให้ 100% สบายๆ — คิดให้รอบคอบ
8. **ใส่ตัวเลขเพิ่มเติม**:
   - Error rate หลัง (%) — เช่น 5
   - รายได้เพิ่ม (฿) — ถ้ามี Sales/Marketing impact
   - ลดต้นทุน (฿) — เช่น OT ที่ลดลง
9. **ใส่ Comment** (optional)
10. **กด ✅ Approve** หรือ ❌ Reject (พร้อม comment ถึงลูกทีม)
11. หลัง approve — รายงานเข้าระบบ ROI Dashboard ทันที (HR เห็น)

> 💡 **เคล็ดลับ**: ถ้าตัวเลขดูสวยเกินไป → reject + comment ขอ evidence เพิ่ม

---

### 👩‍💼 สำหรับ HR Admin — `/index.html` (Dashboard ROI ทั้งระบบ)

**สิทธิ์ของ HR Admin:**
- ✅ เห็นข้อมูลพนักงานทุกคน · ทุกฝ่าย
- ✅ Override Manager Validation ได้
- ✅ Insert/Edit ใน Supabase Studio
- ✅ ดู Dashboard ROI ทั้งองค์กร 9 แท็บ

**Workflow รายเดือน:**

| ช่วงวัน | งาน |
|---|---|
| **1-3** | อัพเดต `ai_costs` table — ใส่ต้นทุน license/setup ของเดือน |
| **4-7** | ส่งลิงก์ login ให้พนักงานใหม่ (ดู section 10) |
| **8-12** | ติดตามการกรอกของพนักงาน — ใครยังไม่ส่ง |
| **13-17** | ติดตาม Manager validation — ถ้าหัวหน้าไหนไม่ทำ ส่งเตือน |
| **18-22** | เปิด Dashboard → ตรวจ ROI · เตรียม Executive Summary |
| **23-25** | Review กับผู้บริหาร · ตัดสินใจตาม Decision Tree |
| **26-30** | ดำเนินการตามผล (Reward / PIP / โอน License) |

**การ insert ข้อมูลผ่าน Supabase Studio:**

ไปที่ https://supabase.com/dashboard/project/vxcobdgptjcprexpktyd/editor

ลำดับ insert ที่ถูกต้อง:
```
1. employees     (ถ้ามีพนักงานใหม่ — ใส่ email ด้วย)
2. baseline      (ต้องมีก่อนใช้ AI · 1 row/พนักงาน)
3. monthly_reports + manager_validations  (อัตโนมัติจากระบบ form)
4. ai_costs      (รายเดือน)
```

---

### 🏛 สำหรับผู้บริหาร (CEO / Board)

**ดูแค่แท็บเดียว: Executive Summary**

ตัวเลข 4 ตัวที่ต้องดู:
1. **AI ROI (Adjusted)** — > 300% = ดี
2. **Active License Rate** — > 80% = ใช้คุ้ม
3. **Net Benefit / เดือน** — เป็นบวก = ลงทุนคุ้ม
4. **Hours Saved รวม** — บอก capacity ที่เพิ่มขึ้น

ถ้าตัวเลขไม่ดี → ไปแท็บ **Decision Tree** → ทำตามคำแนะนำ

---

## 9. การจัดการข้อมูล (เพิ่ม/แก้/ลบ)

### 9.1 เพิ่มพนักงานใหม่

ไปที่ Supabase Studio → Table Editor → `employees` → Insert row

ฟิลด์ที่จำเป็น:
```
emp_code: EMP084 (รหัสไม่ซ้ำ)
full_name: ชื่อ-นามสกุล
department: Dev | QA | Content | Marketing | Operations | Admin | HR
position: ตำแหน่ง
manager: ชื่อหัวหน้า
salary: เงินเดือน
people_cost: เงินเดือน × 1.15 (รวมสวัสดิการ)
hours_per_month: 176
has_license: true / false
```

### 9.2 บันทึก Baseline (ก่อนใช้ AI)

ตาราง `baseline` — รอบเดียวต่อพนักงาน 1 คน:
```
employee_id: 84
task_type: 'เขียนโค้ด/Code review/Debug'
output_before: 15 (ชิ้น/เดือน)
time_per_output_before: 10 (ชม./ชิ้น)
error_before: 12 (%)
measured_month: '2026-04'
```

### 9.3 บันทึก Monthly Report

ตาราง `monthly_reports` — ทุกเดือน:
```
employee_id: 84
fiscal_month: '2026-05'
ai_tool_used: 'Claude Code'
ai_group: 'Adopter' (Champion/Adopter/Beginner/Non-User)
usage_days_per_week: 4
output_after: 28
time_per_output_after: 5.5
hours_saved: 126
self_rating: 4.0
```

### 9.4 บันทึก Manager Validation

ตาราง `manager_validations` — ทุกเดือน หลังพนักงานกรอก:
```
employee_id: 84
fiscal_month: '2026-05'
manager_name: ชื่อหัวหน้า
speed_score: 4.0
output_score: 4.0
quality_score: 4.0
business_impact_score: 4.2
ai_contribution_pct: 60  ← สำคัญที่สุด
approved: true
err_after: 7.5
added_revenue: 0
cost_reduction: 2500
```

### 9.5 อัพเดต AI Cost รายเดือน

ตาราง `ai_costs`:
```
ai_tool_id: 1 (อ้างอิง ai_tools)
fiscal_month: '2026-05'
num_licenses: 78
monthly_license_cost: 147000
training_cost: 0 (ถ้าเดือนนั้นไม่มี training ใหม่)
```

---

## 10. Onboarding พนักงาน

### 10.1 ตั้ง email ของพนักงาน (จำเป็นก่อน login)

ระบบใช้ email เป็นตัวระบุตัวตน — พนักงานทุกคนต้องมี email ในตาราง `employees` ก่อน

**วิธีที่ 1 · Bulk Update ผ่าน CSV (แนะนำ สำหรับเริ่มต้น)**

1. เปิดไฟล์ **`employees_emails_template.csv`** ในโฟลเดอร์ project (ใน Excel/Google Sheets)
2. กรอก email ของพนักงานทุกคนในคอลัมน์ **H (email)**
3. เปิดไฟล์ **`update_employee_emails.sql`** ใน text editor
4. ใช้ Excel สร้าง UPDATE statements ด้วยสูตร:
   ```
   ="UPDATE employees SET email='"&H2&"' WHERE id="&A2&";"
   ```
   ลากสูตรทุกแถว → copy ค่า → paste แทนที่ใน `update_employee_emails.sql`
5. ไป **https://supabase.com/dashboard/project/vxcobdgptjcprexpktyd/sql/new**
6. Paste SQL ทั้งหมด → กด **Run (▶️)**
7. ตรวจผล: section ท้ายไฟล์มี `SELECT` queries ตรวจสอบ

**วิธีที่ 2 · ทีละคน ผ่าน Supabase Studio**

1. ไป https://supabase.com/dashboard/project/vxcobdgptjcprexpktyd/editor
2. เปิด table `employees`
3. คลิก row → ใส่ email → Save

### 10.2 ส่งลิงก์ login ให้พนักงาน

หลังตั้ง email แล้ว ส่งข้อความนี้ให้พนักงาน:

```
สวัสดีค่ะ ทีมงานทุกคน

📊 ระบบประเมิน ROI AI ของบริษัทพร้อมใช้งานแล้ว — กรุณา login ครั้งแรก:

🔗 https://roiai-git-main-efinaihr-9594s-projects.vercel.app/login.html

ขั้นตอน:
1. ใส่ email บริษัทของคุณ
2. กด "ส่ง Magic Link"
3. เปิด email ที่ส่งมา (subject: "Confirm Your Signup")
4. คลิกลิงก์ → ระบบ login อัตโนมัติ
5. กรอกข้อมูลรายงาน AI ของคุณรายเดือน

📋 คู่มือการใช้งาน: USER_GUIDE.md ใน GitHub repo

หากพบปัญหา ติดต่อ: efinaihr@gmail.com

ขอบคุณค่ะ
```

### 10.3 ตรวจสอบว่าใครยัง onboard ไม่เสร็จ

รัน SQL นี้ใน Supabase:
```sql
-- ดูพนักงานที่ยังไม่มี email
SELECT id, full_name, department, role
FROM employees
WHERE email IS NULL OR email = ''
ORDER BY department;

-- ดูพนักงานที่มี email แต่ยังไม่ login ครั้งแรก
SELECT id, full_name, email, role
FROM employees
WHERE email IS NOT NULL AND email <> ''
  AND user_id IS NULL;

-- ดูพนักงานที่ login แล้ว (user_id ผูกแล้ว)
SELECT e.id, e.full_name, e.email, e.role,
       u.last_sign_in_at
FROM employees e
JOIN auth.users u ON u.id = e.user_id
ORDER BY u.last_sign_in_at DESC;
```

### 10.4 พนักงานใหม่ที่เพิ่งจ้าง

1. **เพิ่มใน Supabase**:
```sql
INSERT INTO employees (emp_code, full_name, department, position, role, manager, salary, people_cost, email)
VALUES ('EMP084', 'นาย...', 'Dev', 'Software Developer', 'employee', 'นายหัวหน้า', 50000, 57500, 'newuser@efin.co.th');
```

2. **เพิ่ม Baseline** (รอ 30 วัน หรือใช้ค่าประมาณ):
```sql
INSERT INTO baseline (employee_id, task_type, output_before, time_per_output_before, error_before, measured_month)
VALUES (84, 'เขียนโค้ด/Code review/Debug', 15, 10, 12, '2026-05');
```

3. **ผูก manager**:
```sql
UPDATE employees SET manager_emp_id = (SELECT id FROM employees WHERE full_name = 'นายหัวหน้า')
WHERE id = 84;
```

4. **ส่งลิงก์ login** ให้พนักงาน

---

## 11. Maintenance & Update Code

### 10.1 ลำดับชั้นไฟล์

```
efin-ai-roi/
├── public/
│   └── index.html       ← Frontend ทั้งหมด (1 ไฟล์)
├── package.json
├── README.md
├── USER_GUIDE.md        ← คู่มือนี้
├── DEPLOY.md            ← คู่มือ deploy
├── deploy.bat / .sh     ← script deploy ผ่าน Vercel CLI
├── setup-github.bat     ← script ตั้งค่า GitHub
└── update.bat           ← script update ครั้งถัดไป
```

### 10.2 แก้ไขเว็บแล้ว deploy ใหม่

**ขั้นตอน:**

1. แก้ไฟล์ `public/index.html` (หรือไฟล์อื่น)
2. **ดับเบิลคลิก `update.bat`**
3. ใส่ commit message → Enter
4. รอ ~30 วินาที — Vercel จะ deploy ใหม่อัตโนมัติ
5. ตรวจสอบที่ https://roiai-git-main-efinaihr-9594s-projects.vercel.app

### 10.3 ดู Deployment Status

1. ไป https://vercel.com/efinaihr-9594s-projects/roiai/deployments
2. ดู status:
   - 🟢 **Ready** = deploy สำเร็จ
   - 🔴 **Error** = build fail → คลิกเข้าไปดู error message

### 10.4 Backup ข้อมูล Supabase

**สำคัญ!** ทำเดือนละครั้ง:

1. ไป Supabase Studio → SQL Editor
2. รัน query:
```sql
COPY (SELECT * FROM employees) TO STDOUT WITH CSV HEADER;
COPY (SELECT * FROM monthly_reports) TO STDOUT WITH CSV HEADER;
COPY (SELECT * FROM manager_validations) TO STDOUT WITH CSV HEADER;
```
3. เก็บไฟล์ CSV ไว้

---

## 12. Troubleshooting

### ❌ "ไม่พบ email ในระบบ — โปรดติดต่อ HR"

**สาเหตุ:** email ของพนักงานยังไม่ได้ตั้งใน Supabase

**แก้:** HR ต้องตั้ง email ก่อน — ดู section 10 "Onboarding พนักงาน"

### ❌ คลิก Magic Link แล้วเด้ง "Email link is invalid or has expired"

**สาเหตุ:** ลิงก์ใช้ได้ครั้งเดียว · หมดอายุภายใน 1 ชั่วโมง

**แก้:** กลับไปหน้า login ใหม่ → กดส่ง Magic Link อีกครั้ง → ใช้ลิงก์ใหม่ทันที

### ❌ Login แล้วเด้งกลับไป login.html ซ้ำๆ

**สาเหตุ:** Browser cookies ของ Supabase ถูก block หรือ third-party cookies disabled

**แก้:**
1. เช็คใน Chrome Settings → Privacy → อนุญาต third-party cookies ของ supabase.co
2. ลอง browser อื่น (Firefox, Edge, Safari)
3. ลอง Incognito mode

### ❌ พนักงาน login แล้วเด้งไปหน้า Manager แทนที่จะเป็น Employee (หรือกลับกัน)

**สาเหตุ:** role ใน employees table ตั้งไม่ถูก

**แก้:**
```sql
UPDATE employees SET role = 'employee' WHERE id = 84;  -- เปลี่ยนเป็น employee
UPDATE employees SET role = 'manager' WHERE id = 84;   -- เปลี่ยนเป็น manager
UPDATE employees SET role = 'hr_admin' WHERE id = 84;  -- เปลี่ยนเป็น HR Admin
```

### ❌ เปิดเว็บแล้วเห็นแต่ "กำลังโหลดข้อมูลจาก Supabase..." ไม่หาย

**สาเหตุ:** Supabase ตอบช้า / ปิด / RLS policy ผิด

**แก้:**
1. กด F12 เปิด Console — ดู error
2. ถ้าเห็น `infinite recursion detected in policy` → RLS policy มีปัญหา · ติดต่อ HR Admin
3. ถ้าเห็น `403 Forbidden` → permission ไม่พอ · เช็ค role
4. ถ้าเห็น `Network error` → Supabase project pause หรือไม่ → เข้า dashboard restore

### ❌ Build fail บน Vercel

**สาเหตุที่พบบ่อย:**
- vercel.json มี syntax ผิด → ลบ vercel.json ทิ้ง
- มีไฟล์ใหญ่เกิน → ตรวจสอบใน .gitignore
- import path ผิด

**แก้:**
1. ไป https://vercel.com/efinaihr-9594s-projects/roiai/deployments
2. คลิก deployment ที่ Error → ดู build log
3. แก้ไขใน local → push ใหม่

### ❌ ตัวเลข ROI ผิดปกติ (สูงเกิน / ติดลบเกิน)

**สาเหตุ:**
- AI Contribution % สูงเกินจริง (หัวหน้าให้ 100% โดยไม่คิด)
- เวลาก่อน/หลัง บันทึกผิด (ใส่หน่วยผิด เช่น นาที vs ชั่วโมง)

**แก้:**
1. ไปแท็บ Employees → เรียง ROI สูง→ต่ำ
2. ดูคนที่ ROI > 5,000% — น่าจะมี data ผิด
3. ตรวจ baseline กับ monthly_report ของคนนั้น
4. แก้ใน Supabase Table Editor

### ❌ พนักงานบางคนไม่อยู่ใน Dashboard

**สาเหตุ:** ขาดข้อมูลใน 1 ใน 3 ตาราง:
- `employees` ✓
- `baseline` ✓
- `monthly_reports` ✓

ต้องมีครบทั้ง 3 ตาราง dashboard ถึงจะแสดง

### ❌ Dashboard ไม่อัพเดตหลังแก้ข้อมูลใน Supabase

**สาเหตุ:** Browser cache

**แก้:** กด **Ctrl + Shift + R** (hard refresh)

---

## 13. FAQ

### ❓ ระบบนี้ทดแทนระบบ HR เดิมหรือไม่?

**ไม่** — ระบบนี้แยกออกจาก HR system ตามที่คุณกำหนด ใช้ Supabase project คนละตัว (`efin-ai-roi` vs `hr-system`) แต่ใน user master เก็บข้อมูลพนักงานซ้ำกันได้ — แนะนำให้ sync ผ่าน export/import เดือนละครั้ง

### ❓ เวลาจ้างพนักงานใหม่ทำยังไง?

ไป Supabase Studio → `employees` table → Insert row ใหม่ (ดูข้อ 9.1) — ใช้เวลา 30 วินาที

### ❓ ถ้าพนักงานลาออกล่ะ?

เก็บ record ไว้ก่อน (เพื่อ historical data) แล้ว set field `has_license = false` — Dashboard จะข้ามคนนั้นไปอัตโนมัติ

### ❓ ทำไมต้องใช้ AI Contribution % ไม่ใช้ Total Benefit ตรงๆ?

เพื่อ **ความยุติธรรม** — บางครั้ง output เพิ่มขึ้นไม่ได้เกิดจาก AI 100% (อาจเป็นเพราะลูกค้าเพิ่ม / ทีมช่วย / process ดีขึ้นเอง) ถ้าให้เครดิต AI 100% โดยไม่หัก จะ over-claim ROI

### ❓ AI Contribution % เท่าไรถึงถือว่าใช้ AI จริงๆ?

แนวทาง:
- **70%+** = AI เป็นปัจจัยหลัก → ผลลัพธ์ส่วนใหญ่จาก AI
- **40-70%** = AI เป็น tool สำคัญแต่ไม่ใช่ทั้งหมด
- **< 40%** = AI เป็นแค่ส่วนเสริม → ไม่ควรนับเป็น ROI ของ AI tool

### ❓ Dashboard เปิดได้ทุกคนเลยหรือ? ปลอดภัยไหม?

URL `https://roiai-git-main-efinaihr-9594s-projects.vercel.app` **เปิด public** ใครก็เห็นได้

ข้อมูลที่ public:
- ชื่อพนักงาน · ตำแหน่ง
- เงินเดือน · ROI ตัวเลข

**ถ้าต้องการป้องกัน:**
1. ตั้ง Vercel Password Protection (Pro plan)
2. หรือเพิ่ม Supabase Auth + Row Level Security
3. หรือทำ private deploy

### ❓ ระบบนี้ใช้ฟรีตลอดหรือ?

**ฟรี ใน free tier:**
- Vercel: Hobby plan (100GB bandwidth/เดือน)
- Supabase: Free tier (500MB DB · 50K monthly active users)
- GitHub: Public repo ฟรี

ถ้า scale ขึ้น (10,000+ พนักงาน หรือ traffic เยอะ) อาจต้อง upgrade

### ❓ ถ้าอยาก export ข้อมูลเป็น Excel ทำยังไง?

ไป Supabase Studio → SQL Editor → รัน query → Download CSV → เปิดใน Excel

หรือ **เพิ่มปุ่ม Export ใน Dashboard** — บอกผมเดี๋ยวเพิ่มให้

### ❓ ต้องการเพิ่มฝ่าย / KPI / Chart ทำยังไง?

แก้ไฟล์ `public/index.html` (หรือบอกผม) → push update.bat → 30 วินาที deploy ใหม่

### ❓ ระบบรองรับหลายภาษาไหม?

ปัจจุบันแสดงภาษาไทย ถ้าอยากเพิ่ม Eng → ต้องเพิ่ม i18n layer (บอกผมเดี๋ยวทำให้)

---

## 📞 ติดต่อ / Support

หากพบปัญหาในการใช้งาน:
1. ดู **Troubleshooting** ส่วนที่ 11 ก่อน
2. ตรวจสอบ Supabase Studio · Vercel Logs
3. ดู GitHub repo สำหรับ commit history

---

## 📝 Changelog

- **2026-05-09**: v1.1 · เพิ่มระบบ Authentication (Magic Link) · 3 หน้าใหม่ (login/employee/manager) · RLS policies · CSV template สำหรับ HR
- **2026-05-08**: v1.0 · ระบบเริ่มต้น · 83 พนักงาน · 7 ฝ่าย · ROI 1,459%

---

> **efin AI Productivity & ROI Evaluation Framework** — Built with Supabase + Vercel · ออกแบบเพื่อใช้กับระบบประเมินพนักงานรอบ 90 วัน · แยกออกจาก HR system
