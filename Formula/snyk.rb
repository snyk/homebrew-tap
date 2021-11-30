class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.778.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.778.0/snyk-macos"
    sha256 "227d7078fe2352da840c8a1cd8a8a95e841894ba740e6b6e45bc0e2789539727"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.778.0/snyk-linux"
    sha256 "9f0b6634da0a1bcf1a64ff1cf2df2200a4c2d4003055a8b65192dc36d8a2ba9f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
