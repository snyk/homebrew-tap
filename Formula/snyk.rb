class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.692.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.692.0/snyk-macos"
    sha256 "88c001c9cf9da2bd085d9da4e5e9b823b2f8be6f417b75804c13b3b2d1e2fdac"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.692.0/snyk-linux"
    sha256 "ced34aa43b399ba4f4773598a214598491d5335edd4efe5518ab3302647887ab"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
