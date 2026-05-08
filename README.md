# efin · AI Productivity & ROI Evaluation Framework

ระบบประเมิน ROI ของพนักงาน efin ที่ใช้ AI vs ไม่ใช้ AI — Live dashboard เชื่อม Supabase

> **โปรเจกต์นี้แยกออกจากระบบ HR** (Supabase project: `efin-ai-roi` — ไม่ปนกับ `hr-system`)

## สถาปัตยกรรม

```
[Frontend (HTML+JS)]  →  [Supabase Postgres]
   Vercel Static            efin-ai-roi project
                            ap-southeast-1 (Singapore)
```

## Backend: Supabase

- **Project URL**: https://vxcobdgptjcprexpktyd.supabase.co
- **Region**: ap-southeast-1 (Singapore)
- **Tables**: `employees`, `baseline`, `monthly_reports`, `manager_validations`, `ai_costs`, `dept_targets`, `ai_tools`, `audit_log`
- **View**: `v_roi_dashboard` (computed ROI per employee)
- **RLS**: เปิดทุก table · public read policies (ใช้ publishable key)

### Schema (6 sheets ตาม flow)

| Table | ตรงกับ Tab | คำอธิบาย |
|---|---|---|
| `employees` | Tab 1 Employee Master | ข้อมูลพนักงาน + License status |
| `ai_costs` | Tab 2 AI Cost Master | ต้นทุน AI รายเดือน |
| `baseline` | Tab 3 Baseline | ข้อมูลก่อนใช้ AI |
| `monthly_reports` | Tab 4 Monthly Usage | พนักงานกรอกรายเดือน |
| `manager_validations` | Tab 5 Manager Validation | หัวหน้าตรวจ + AI Contribution % |
| `v_roi_dashboard` | Tab 6 ROI Dashboard | View ที่คำนวณอัตโนมัติ |

## Frontend: Static HTML + Vercel

ไม่ต้อง build — ใช้ `index.html` เป็น static site ได้เลย

### Local dev
```bash
npx serve .
# หรือเปิด index.html ตรงๆ
```

### Deploy to Vercel

**Option A: ผ่าน CLI (แนะนำ)**
```bash
cd efin-ai-roi
npm i -g vercel
vercel login
vercel --prod
```

**Option B: ผ่าน Vercel Dashboard**
1. Push folder นี้ขึ้น GitHub
2. ไปที่ https://vercel.com/new
3. Import repo → Deploy (auto-detect static site)

**Option C: Drag & Drop**
1. ไปที่ https://vercel.com/new
2. ลากโฟลเดอร์ `efin-ai-roi` ลงไป → Deploy

## ROI Formulas

```
Hourly Rate     = Salary ÷ 176
Hours Saved     = (Time Before − Time After) × Output After
Value Saved     = Hours Saved × Hourly Rate
Total Benefit   = Value Saved + Added Revenue + Cost Reduction
Adjusted Benefit = Total Benefit × AI Contribution %
Adjusted ROI    = (Adjusted Benefit − AI Cost) ÷ AI Cost × 100
```

## ROI Bands (5 ระดับ)

| Band | ROI | Action |
|---|---|---|
| 🟢 คุ้มมาก | > 300% | ขยายผลทั้งทีม |
| 🔵 คุ้ม | 100–300% | ใช้ต่อ + ปรับ process |
| 🟡 เริ่มคุ้ม | 0–100% | อบรมเพิ่ม |
| 🔴 ติดลบ | < 0% | ทบทวน License |
| ⚠️ License สูญเปล่า | ไม่ใช้ | โอน/ยกเลิก |

## 4 Employee Groups

- 🏆 **AI Champion** — ROI สูง · ใช้ AI ดี → Reward · ตั้งเป็นต้นแบบ
- 🚀 **AI Adopter** — ใช้สม่ำเสมอ · ROI กลาง → อบรมเพิ่ม
- 🌱 **AI Beginner** — เริ่มใช้ → Workshop + Coaching
- ⚪ **Non-AI User** — ไม่ใช้ → Pilot 30 วัน หรือ PIP

## Mock Data

83 พนักงาน 7 ฝ่าย: Dev (40), QA (13), Operations (12), Content (6), Marketing (6), Admin (4), HR (4)

แทนที่ mock data ด้วย real data ผ่าน Supabase Studio: https://supabase.com/dashboard/project/vxcobdgptjcprexpktyd
