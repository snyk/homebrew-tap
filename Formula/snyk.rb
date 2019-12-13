class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.259.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.259.0/snyk-macos"
    sha256 "d3adcdc87ad5ae8b18506923db5f6b992e62868b1daa0f72b8bd454ad27942dd"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.259.0/snyk-linux"
    sha256 "789105320ed21a76ccf877995ec50d13b149b80fcc9d94e5404f2ee3e5ffe499"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
