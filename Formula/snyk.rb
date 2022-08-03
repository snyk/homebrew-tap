class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.982.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.982.0/snyk-macos"
    sha256 "a344b7d0e6e5aa1f9989f386115705c46e13de2423f49b4253a4411f1b3f8968"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.982.0/snyk-linux"
    sha256 "82af3527c406a4fb7a9c5c13b984b848b8705ec076dfc6bc0736dcd14111de53"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
