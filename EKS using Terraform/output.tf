output "cluster_id" {
  value = aws_eks_cluster.samarthkhanna.id
}

output "node_group_id" {
  value = aws_eks_node_group.samarthkhanna.id
}

output "vpc_id" {
  value = aws_vpc.samarthkhanna_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.samarthkhanna_subnet[*].id
}
