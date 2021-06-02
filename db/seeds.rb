# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# admin = Role.create(code: 'admin', name: 'Admin')
# User.create(username: 'dummy.admin', email: 'dummy.admin@mail.com', password: 'password', fullname: 'Dummy Admin', role_id: admin.id)

# specialty = Specialty.create(name: 'Bedah Orthopedi & Traumatologi')
# doctor1 = Doctor.create(code: 'SPOT0001', name: 'ADITYA FUAD ROBBY TRIANGGA, Sp.OT., dr.', specialty_id: specialty.id)
# doctor2 = Doctor.create(code: 'SPOT0002', name: 'LUTHFI HIDAYAT, Sp.OT(K), dr.', specialty_id: specialty.id)
# schedule1 = Schedule.create(doctor_id: doctor1.id, day_name: 'Thursday', start_time: Time.zone.parse('09:00'), end_time: Time.zone.parse('11:00'))
# schedule2 = Schedule.create(doctor_id: doctor1.id, day_name: 'Saturday', start_time: Time.zone.parse('09:00'), end_time: Time.zone.parse('11:00'))
# schedule3 = Schedule.create(doctor_id: doctor2.id, day_name: 'Thursday', start_time: Time.zone.parse('14:00'), end_time: Time.zone.parse('16:00'))
# schedule4 = Schedule.create(doctor_id: doctor2.id, day_name: 'Saturday', start_time: Time.zone.parse('14:00'), end_time: Time.zone.parse('16:00'))

hospital1 = Hospital.create(name: 'RS ABC Jakarta', address: 'Jalan A', phone_number: '021-1234-567')
hospital2 = Hospital.create(name: 'RS ABC Bekasi', address: 'Jalan B', phone_number: '021-2233-445')
placements = Placement.create([
                                {hospital_id:hospital1.id, doctor_id: 1},
                                {hospital_id:hospital1.id, doctor_id: 2},
                                {hospital_id:hospital1.id, doctor_id: 3},
                                {hospital_id:hospital1.id, doctor_id: 5},
                                {hospital_id:hospital2.id, doctor_id: 1},
                                {hospital_id:hospital2.id, doctor_id: 2},
                                {hospital_id:hospital2.id, doctor_id: 4},
                                {hospital_id:hospital2.id, doctor_id: 6}
                              ])