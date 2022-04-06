class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.895.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.895.0/snyk-macos"
    sha256 "ac29e2d8497ebdba76d59100df918def57e51fea3a127c305f4686fa413aed03"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.895.0/snyk-linux"
    sha256 "fe9e0687a60245367787242617798ef662b216be672b03c386a7ec74a9ac489f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
