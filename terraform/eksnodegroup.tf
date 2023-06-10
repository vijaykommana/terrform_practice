resource "aws_iam_role" "node" {
  name = "test-role-eks-node-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node.name
}

resource "aws_eks_node_group" "eks-node" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "eks-node"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]


scaling_config {
  desired_size = 1
  max_size     = 2
  min_size     = 1
}
ami_type             = "AL2_x86_64"
disk_size            = 20
instance_types       = ["t3.medium"]
capacity_type        = "ON_DEMAND"
force_update_version = false

update_config {
  max_unavailable = 1
}

depends_on = [
  aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
  aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy,
  aws_iam_role_policy_attachment.node-AmazonEC2ContainerRegistryReadOnly
]
}

 