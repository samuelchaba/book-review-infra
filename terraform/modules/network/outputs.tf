output "vpc_id" { value = aws_vpc.main.id }
output "public_subnet_id" { value = aws_subnet.public.id }
output "private_subnet_ids" { value = aws_subnet.private[*].id }
output "frontend_security_group_id" { value = aws_security_group.frontend.id }
output "backend_security_group_id" { value = aws_security_group.backend.id }
output "database_security_group_id" { value = aws_security_group.database.id }
