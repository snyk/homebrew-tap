class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1053.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1053.0/snyk-macos"
    sha256 "8c8b8210aca24df4655ec2a67345098577bc1ee4303344c64db0b3354cb695cb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1053.0/snyk-linux"
    sha256 "a42285723244c8a25fba62c0392e51a101b640cd6a2761a05ae7e455f894bfdf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
