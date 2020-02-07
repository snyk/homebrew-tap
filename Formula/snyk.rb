class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.290.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.290.2/snyk-macos"
    sha256 "c678873cdbfbbfcfea582b681b7e22b12b43e48d6faad7756b7a5fbe405110a0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.290.2/snyk-linux"
    sha256 "e79f5345bbd88af63f6c6bb7c3fb57f259bf1647a486f852cac5fc2ba79fa0d0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
