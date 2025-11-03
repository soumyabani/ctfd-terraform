resource "ctfd_challenge_standard" "http" {
  name        = "Challenge1"
  category    = "cryptography"
  description = "This is a cryptography based challenge"
  value       = 500

  topics = [
    "cryptography"
  ]
  tags = [
    "basic"
  ]
}

resource "ctfd_flag" "http_flag" {
  challenge_id = ctfd_challenge_standard.http.id
  content      = "CTFflag"
}

resource "ctfd_hint" "http_hint_1" {
  challenge_id = ctfd_challenge_standard.http.id
  content      = "Some super-helpful hint"
  cost         = 50
}
