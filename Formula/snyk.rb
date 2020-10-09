class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.410.4"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.410.4/snyk-macos"
    sha256 "45f54f6471ad3f4dd06d4c52f9829fde650e039f1d7edd2bb06dc939dfbccc95"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.410.4/snyk-linux"
    sha256 "eeca9c4d138b0b06e1e83f94859113ad2f8705afbfe3c9b3f5dca1f2de161f99"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
