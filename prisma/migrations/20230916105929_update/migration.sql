/*
  Warnings:

  - You are about to drop the `AcademicDepartment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AcademicFaculty` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AcademicSemister` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "AcademicDepartment" DROP CONSTRAINT "AcademicDepartment_academicFacultyId_fkey";

-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_academicDepartmentId_fkey";

-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_academicFacultyId_fkey";

-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_academicSemesterId_fkey";

-- AlterTable
ALTER TABLE "Student" ALTER COLUMN "contactNo" SET DATA TYPE TEXT;

-- DropTable
DROP TABLE "AcademicDepartment";

-- DropTable
DROP TABLE "AcademicFaculty";

-- DropTable
DROP TABLE "AcademicSemister";

-- CreateTable
CREATE TABLE "Academic_Semister" (
    "id" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "code" INTEGER NOT NULL,
    "startMonth" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Academic_Semister_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Academic_Faculty" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Academic_Faculty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Academic_Department" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "academicFacultyId" TEXT NOT NULL,

    CONSTRAINT "Academic_Department_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Academic_Department" ADD CONSTRAINT "Academic_Department_academicFacultyId_fkey" FOREIGN KEY ("academicFacultyId") REFERENCES "Academic_Faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_academicSemesterId_fkey" FOREIGN KEY ("academicSemesterId") REFERENCES "Academic_Semister"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_academicDepartmentId_fkey" FOREIGN KEY ("academicDepartmentId") REFERENCES "Academic_Department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_academicFacultyId_fkey" FOREIGN KEY ("academicFacultyId") REFERENCES "Academic_Faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
