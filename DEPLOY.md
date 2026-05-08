# 🚀 วิธี Deploy ขึ้น Vercel

โฟลเดอร์นี้พร้อม deploy แล้ว — เลือก 1 ใน 3 วิธี

---

## ✅ Option A: Drag & Drop (เร็วที่สุด · 30 วินาที)

1. ไปที่ https://vercel.com/new
2. Login ด้วย GitHub / Google / Email
3. **ลากโฟลเดอร์ `efin-ai-roi` ทั้งโฟลเดอร์** ลงไปในช่อง drop zone
4. กด **Deploy**
5. รอ ~10 วิ → ได้ URL `https://efin-ai-roi-xxx.vercel.app`

---

## ✅ Option B: Vercel CLI

```bash
# ติดตั้ง CLI ครั้งแรก
npm i -g vercel

# เข้าโฟลเดอร์
cd efin-ai-roi

# Login (ครั้งแรก)
vercel login

# Deploy preview
vercel

# Deploy production
vercel --prod
```

ระหว่าง deploy CLI จะถาม:
- Project name → `efin-ai-roi` (กด Enter ใช้ค่า default)
- Directory → `.` (กด Enter)
- Framework → **Other** หรือ Static
- Build/output settings → ใช้ default ทั้งหมด

---

## ✅ Option C: ผ่าน GitHub (best for production)

```bash
# ใน folder efin-ai-roi
git init
git add .
git commit -m "Initial: efin AI ROI dashboard"

# สร้าง repo ใหม่บน GitHub แล้ว
git remote add origin https://github.com/YOUR_USERNAME/efin-ai-roi.git
git push -u origin main
```

จากนั้นที่ https://vercel.com/new:
1. กด **Import Git Repository**
2. เลือก repo `efin-ai-roi`
3. กด **Deploy**

ทุกครั้งที่ push ขึ้น GitHub → Vercel จะ auto deploy ใหม่อัตโนมัติ

---

## 🔗 หลัง deploy แล้ว

Dashboard จะดึงข้อมูลจาก Supabase อัตโนมัติ — ไม่ต้องตั้ง env var เพิ่ม
(publishable key อยู่ใน `index.html` แล้ว — ปลอดภัยใช้ฝั่ง client เพราะมี RLS เปิดอยู่)

## ⚙️ Custom Domain (optional)

ใน Vercel Dashboard → Project → Settings → Domains → Add `roi.efin.finance` หรือ subdomain ที่ต้องการ

## 🔒 ความปลอดภัย

- Publishable key (`sb_publishable_...`) → ใช้ฝั่ง client ได้ ปลอดภัย เพราะ RLS เปิดอยู่
- ห้ามเอา Service Role Key ขึ้น frontend
- RLS policy ปัจจุบัน: public read เท่านั้น (write ไม่ได้ผ่าน publishable key)
