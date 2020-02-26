class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.297.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.297.1/snyk-macos"
    sha256 "86fdf9f1c4540469309c21cb93407d3322d8d097915dc1a52145c19703f1b12e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.297.1/snyk-linux"
    sha256 "32d887c01e8ba7f1f80d75bcd7fe3e383bf472976368d39f108fe759043acd0b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
