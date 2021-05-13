class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.594.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.594.0/snyk-macos"
    sha256 "6fff65fb01d4ed2235e94ed9e760eef429a7d315fe1eb91636ee6c7d73b3e6d7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.594.0/snyk-linux"
    sha256 "d6aba64774be4fbcf5e61f6a1f46e543ac1103986ac26080d22c686a608101dd"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
