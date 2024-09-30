# Ce module pour : la gestion du load balancing
resource "aws_lb" "app-lb" {
  count = var.lb_count
  name = var.lb_props.lb_name
  load_balancer_type = var.lb_props.lb_type
  internal = var.lb_props.lb_internal
  security_groups = var.lb_sg_ids
  subnets = var.lb_subnet_ids
}

resource "aws_lb_target_group" "app-lb-tg" {
  count = var.lb_count
  name = var.lb_tg_props.lb_tg_name
  port = var.lb_tg_props.lb_tg_port
  protocol = var.lb_tg_props.lb_tg_proto
  target_type = var.lb_tg_props.lb_tg_type
  vpc_id = var.lb_tg_vpc_id
}

resource "aws_lb_target_group_attachment" "app-lb-tg-attachments" {
  count = var.lb_tg_att_count
  target_group_arn = aws_lb_target_group.app-lb-tg[0].arn
  target_id = var.lb_tg_instance_ids[count.index]
}

resource "aws_lb_listener" "app-http-listener" {
  count = var.lb_count
  port = 80
  load_balancer_arn = aws_lb.app-lb[0].arn
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app-lb-tg[0].arn
  }
}


resource "aws_lb_listener_rule" "app-http-listener-rule" {
  count = var.lb_count
  listener_arn = aws_lb_listener.app-http-listener[0].arn
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app-lb-tg[0].arn
  }
  condition {
    path_pattern {
      values = ["/"]
    }
  }
}