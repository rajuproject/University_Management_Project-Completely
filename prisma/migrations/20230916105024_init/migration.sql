-- CreateTable
CREATE TABLE "Student" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "middleName" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contactNo" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "bloodgroup" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "academicSemesterId" TEXT NOT NULL,
    "academicDepartmentId" TEXT NOT NULL,
    "academicFacultyId" TEXT NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AcademicDepartment" ADD CONSTRAINT "AcademicDepartment_academicFacultyId_fkey" FOREIGN KEY ("academicFacultyId") REFERENCES "AcademicFaculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_academicSemesterId_fkey" FOREIGN KEY ("academicSemesterId") REFERENCES "AcademicSemister"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_academicDepartmentId_fkey" FOREIGN KEY ("academicDepartmentId") REFERENCES "AcademicDepartment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_academicFacultyId_fkey" FOREIGN KEY ("academicFacultyId") REFERENCES "AcademicFaculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
